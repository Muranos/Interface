local E, L, C = select(2, ...):unpack()

local P = E["Party"]
local format = string.format
local gsub = string.gsub

local spells = {
	name = SPELLS,
	order = -1,
	type = "group",
	childGroups = "tab",
	args = {
		uncheck = {
			name = CLEAR_ALL,
			order = 10,
			type = "execute",
			func = function()
				wipe(E.db.spells)
				wipe(P.enabledLT)
				E.db.noDefault = true
				P:Refresh()
			end,
			confirm = E.ConfirmAction,
		},
		default = {
			name = RESET_TO_DEFAULT,
			order = 20,
			type = "execute",
			func = function()
				wipe(E.db.spells)
				E.db.noDefault = nil
				E.UpdateEnabledLT(P)
				P:Refresh()
			end,
			confirm = E.ConfirmAction,
		},
		class = {
			name = CLASS,
			order = 30,
			type = "group",
			args = {}
		},
		other = {
			name = OTHER,
			order = 40,
			type = "group",
			args = {}
		},
	}
}

for i = 1, MAX_CLASSES do
	local class = CLASS_SORT_ORDER[i]
	local icon = E.ICO.CLASS .. class
	local name = LOCALIZED_CLASS_NAMES_MALE[class]
	spells.args.class.args[class] = {
		icon = icon,
		name = name,
		type = "group",
	}
end

for i = 1, 4 do
	local class = E.OTHER_SORT_ORDER[i]
	local icon = E.ICO[class]
	local name = E.L_CATAGORY_OTHER[class]
	spells.args.other.args[class] = {
		icon = icon,
		name = name,
		type = "group",
	}
end

local getter = function(info)
	local v = E.options.args.Party.args.spells.args[ info[3] ].args[ info[4] ].args[info[5] ].arg
	return P.IsSpellEnabled(v)
end

local setter = function(info, state)
	local option = info[#info]
	local id = gsub(option, "spell", "")
	id = tonumber(id)
	E.db.spells[option] = state
	P.enabledLT[id] = state or nil

	P:Refresh()
end

local function AddSpellInfo()
	for i = 1, 2 do
		local tab = i == 1 and "class" or "other"
		local numClasses = i == 1 and MAX_CLASSES or 4

		for j = 1, numClasses do
			local class = i == 1 and CLASS_SORT_ORDER[j] or E.OTHER_SORT_ORDER[j]

			spells.args[tab].args[class].args = {}

			local classSpells = E.spellList[class]
			local numClassSpells = #classSpells

			for k = 1, numClassSpells do
				local v = classSpells[k]
				if not v.hide then
					local id = v.spellID
					local icon = v.icon
					local name = GetSpellInfo(id)

					spells.args[tab].args[class].args["spell" .. id] = {
						name = function() return format("|T%s:20|t %s", icon, name) end,
						desc = function()
							local duration = type(v.duration) == "number" and v.duration or v.duration.default
							local charges = v.charges and (type(v.charges) == "number" and v.charges or v.charges.default)
							local s = Spell:CreateFromSpellID(id)
							local spellDesc = s:GetSpellDescription() or ""
							local extra = "\n\n|cffffd700" .. L["Spell ID"] .. "|r " .. id ..
								"\n\n|cffffd700" .. TYPE .. "|r " .. E.L_PRIORITY[v.type] ..
								"\n\n|cffffd700" .. L["Cooldown"] .. "|r " .. SecondsToTime(duration) ..
								(charges and charges ~= 1 and "\n\n" .. format(SPELL_MAX_CHARGES, charges) or "")
							return spellDesc .. extra
						end,
						order = k,
						width = "full",
						type = "toggle",
						get = getter,
						set = setter,
						arg = v,
					}
				end
			end
		end
	end
end

function P:AddSpellPicker()
	AddSpellInfo()

	self:Refresh()
end

P.options.args["spells"] = spells

E:RegisterModuleOptions("Party", P.options, "Party")
