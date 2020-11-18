local E, L, C = select(2, ...):unpack()

local format = string.format
local strlen = string.len

local defaultBackup = {}
local classesWithIcons = {}
local specIDs = {}

local function GetSpecID(info, n)
	n = n or 1
	local id = info[#info - n]:gsub("spec", "")
	return tonumber(id)
end

for i = 1, MAX_CLASSES do
	local class = CLASS_SORT_ORDER[i]
	classesWithIcons[class] = format("|T%s:18|t %s", "Interface\\Icons\\ClassIcon_" .. class, LOCALIZED_CLASS_NAMES_MALE[class])
	for j = 1, GetNumSpecializationsForClassID(i) do
		local id = GetSpecializationInfoForClassID(i, j)
		specIDs[#specIDs + 1] = id
	end
end

classesWithIcons["ALL"] = format("|T%s:16|t %s", "Interface\\Icons\\inv_60pvp_trinket2d", ALL_CLASSES)

local function GetClassIndexBySpellID(id)
	for class, v in pairs(E.spellList) do
		for i = 1, #v do
			local t = v[i]
			if (t.spellID == id) then
				return class, i
			end
		end
	end
end

function E:AddSpellPickers()
	for k in pairs(self.moduleOptions) do
		local func = self[k].AddSpellPicker
		if func then
			func(self[k])
		end
	end
end

function E:AddCustomSpells(init)
	local spellList = self.spellList

	for k, v in pairs(defaultBackup) do
		local class, i = GetClassIndexBySpellID(k)
		spellList[class][i] = self.DeepCopy(v)
	end

	for k, v in pairs(OmniCDDB.cooldowns) do
		local class, i = GetClassIndexBySpellID(k)
		if class ~= v.class then
			if class then
				tremove(spellList[class], i)
			end
			spellList[v.class][#spellList[v.class] + 1] = v
		else
			if not v.custom and not defaultBackup[k] then
				defaultBackup[k] = self.DeepCopy(spellList[class][i])
			end
			spellList[class][i] = v
		end

		if E.L_HIGHLIGHTS[v.type] then
			self.Cooldowns:RegisterRemoveHighlightByCLEU(v.buff or k) -- [14]
		end
	end

	if not init then
		self:AddSpellPickers()
	end
end

function E:Delete(info)
	local id = self.GetSpellID(info)

	if not defaultBackup[id] then
		local class, i = GetClassIndexBySpellID(id)
		tremove(self.spellList[class], i)

		self.highlightLT[id] = nil

		for k in pairs(self.moduleOptions) do
			local t = self[k].enabledLT
			if t then
				t[id] = nil
			end
		end
		self.db.spells["spell" .. id] = nil
	end

	OmniCDDB.cooldowns[id] = nil
	self.options.args.spellEditor.args[ info[#info-1] ] = nil

	self:AddCustomSpells()
end

local nameSpellID = function(info)
	local id = E.GetSpellID(info)
	local suffix = defaultBackup[id] and " |cff9d9d9d(" .. DEFAULT .. ")|r\n" or " |cff20ff20(" .. NEW .. ")|r\n"
	return " |cffffd700" .. L["Spell ID"] .. "|r " .. id .. suffix
end

local disableClass = function(info)
	local id = E.GetSpellID(info)
	return defaultBackup[id]
end

local setterClass = function(info, value)
	local id = E.GetSpellID(info)
	OmniCDDB.cooldowns[id].spec = nil
	OmniCDDB.cooldowns[id].duration = { default = OmniCDDB.cooldowns[id].duration.default }
	OmniCDDB.cooldowns[id].charges = { default = OmniCDDB.cooldowns[id].charges.default }
	OmniCDDB.cooldowns[id].class = value

	if value == "ALL" then
		OmniCDDB.cooldowns[id].type = "all"
	else
		local spellType = OmniCDDB.cooldowns[id].type
		OmniCDDB.cooldowns[id].type = (not spellType or spellType == "all") and "cc" or spellType
	end

	E:AddCustomSpells()
end

local disableOnOthers = function(info)
	local id = E.GetSpellID(info)
	return E.L_CATAGORY_OTHER[OmniCDDB.cooldowns[id].class]
end

local disableOnNoHighlights = function(info)
	local id = E.GetSpellID(info)
	return not E.L_HIGHLIGHTS[OmniCDDB.cooldowns[id].type]
end

local hideOnClass = function(info)
	local id = E.GetSpellID(info)
	return OmniCDDB.cooldowns[id].class ~= "ALL"
end

local nameCharges = function(info)
	local id = E.GetSpellID(info)
	local value = OmniCDDB.cooldowns[id].charges.default
	return format(SPELL_MAX_CHARGES, value)
end

local getterDurationCharge = function(info)
	local option = info[#info]
	local id = E.GetSpellID(info)
	return OmniCDDB.cooldowns[id][option].default
end

local setterDurationCharge = function(info, value)
	local option = info[#info]
	local id = E.GetSpellID(info)
	OmniCDDB.cooldowns[id][option].default = value

	E:AddCustomSpells()
end

local getterSpecTalent = function(info)
	local id = E.GetSpellID(info)
	return OmniCDDB.cooldowns[id].spec == true or type(OmniCDDB.cooldowns[id].spec) == "number"
end

local disableItem2 = function(info)
	local id = E.GetSpellID(info)
	return OmniCDDB.cooldowns[id].item == nil
end

local getterItem = function(info)
	local option = info[#info]
	local id = E.GetSpellID(info)
	return OmniCDDB.cooldowns[id][option] and tostring(OmniCDDB.cooldowns[id][option]) or ""
end

local setterItem = function(info, value)
	local option = info[#info]
	local id = E.GetSpellID(info)
	if value == "" then
		OmniCDDB.cooldowns[id][option] = nil
	elseif ( strlen(value) > 9 or not GetItemInfoInstant(value) ) then
		E.Write(L["Invalid ID"])
		return
	else
		OmniCDDB.cooldowns[id][option] = tonumber(value)
	end

	E:AddCustomSpells()
end

local getterBuff = function(info)
	local option = info[#info]
	local id = E.GetSpellID(info)
	return OmniCDDB.cooldowns[id][option] and tostring(OmniCDDB.cooldowns[id][option]) or tostring(id)
end

local setterBuff = function(info, value)
	local option = info[#info]
	local id = E.GetSpellID(info)
	if value == "" then
		OmniCDDB.cooldowns[id][option] = id
	elseif ( strlen(value) > 9 ) then
		E.Write(L["Invalid ID"])
		return
	else
		OmniCDDB.cooldowns[id][option] = tonumber(value)
	end

	E:AddCustomSpells()
end

local hideSpec = function(info)
	local id = E.GetSpellID(info)
	local specID = GetSpecID(info, 0)
	if not specID then return end
	local class = OmniCDDB.cooldowns[id].class
	if class == "ALL" then return true end
	if class ~= select(6, GetSpecializationInfoByID(specID)) then return true end
	if OmniCDDB.cooldowns[id].spec == true or type(OmniCDDB.cooldowns[id].spec) == "number" then return true end
end

local getterSpec = function(info)
	local option = info[#info]
	local id = E.GetSpellID(info, 2)
	local specID = GetSpecID(info)
	return OmniCDDB.cooldowns[id][option][specID] or OmniCDDB.cooldowns[id][option].default
end

local setterSpec = function(info, value)
	local option = info[#info]
	local id = E.GetSpellID(info, 2)
	local specID = GetSpecID(info)
	if value == OmniCDDB.cooldowns[id][option].default then
		value = nil
	end
	OmniCDDB.cooldowns[id][option][specID] = value

	E:AddCustomSpells()
end

local getterSpecEnabled = function(info)
	local id = E.GetSpellID(info, 2)
	local specID = GetSpecID(info)
	if not OmniCDDB.cooldowns[id].spec then return true end
	if type(OmniCDDB.cooldowns[id].spec) ~= "table" then return false end
	for i = 1, #OmniCDDB.cooldowns[id].spec do
		if OmniCDDB.cooldowns[id].spec[i] == specID then return true end
	end
end

local setterSpecEnabled = function(info, value)
	local id = E.GetSpellID(info, 2)
	local specID = GetSpecID(info)

	if not OmniCDDB.cooldowns[id].spec then
		OmniCDDB.cooldowns[id].spec = {}
		for i = 1, #specIDs do
			local class = select(6, GetSpecializationInfoByID(specIDs[i]))
			if OmniCDDB.cooldowns[id].class == class then
				tinsert(OmniCDDB.cooldowns[id].spec, specIDs[i])
			end
		end
	end

	for i = #OmniCDDB.cooldowns[id].spec, 1, -1 do
		if not value and OmniCDDB.cooldowns[id].spec[i] == specID then
			tremove(OmniCDDB.cooldowns[id].spec, i)
			break
		end
	end

	if value then
		tinsert(OmniCDDB.cooldowns[id].spec, specID)
	end

	E:AddCustomSpells()
end

local customSpellInfo = {
	lb1 = {
		name = nameSpellID,
		order = 0,
		type = "description",
	},
	delete = {
		name = DELETE,
		desc = L["Default spells are reverted back to original values and removed from the list only"],
		order = 1,
		type = "execute",
		func = "Delete",
		handler = E,
	},
	hd1 = {
		name = "", order = 2, type = "header",
	},
	class = {
		disabled = disableClass,
		name = CLASS,
		order = 3,
		type = "select",
		values = classesWithIcons,
		set = setterClass,
	},
	type = {
		disabled = disableOnOthers,
		name = TYPE,
		desc = L["Set the spell type for sorting"],
		order = 4,
		type = "select",
		values = E.L_SPELL_TYPE,
	},
	duration = {
		name = L["Cooldown"],
		desc = E.STR.MAX_RANGE,
		order = 5,
		type = "range",
		min = 1, max = 999, softMax = 300, step = 1,
		get = getterDurationCharge,
		set = setterDurationCharge,
	},
	charges = {
		name = nameCharges,
		order = 6,
		type = "range",
		min = 1, max = 10, step = 1,
		get = getterDurationCharge,
		set = setterDurationCharge,
	},
	lb2 = {
		name = "\n", order = 7, type = "description",
	},
	spec = {
		hidden = disableOnOthers,
		name = L["Talent Ability"],
		desc = L["Check this option if the spell is a talent ability to ensure proper spell detection"],
		order = 8,
		width = "full",
		type = "toggle",
		get = getterSpecTalent,
	},
	lb3 = {
		hidden = hideOnClass,
		name = "|cffffd700" .. INVTYPE_TRINKET,
		order = 9,
		type = "description",
		fontSize = "medium",
	},
	item = {
		hidden = hideOnClass,
		name = L["Item ID (Optional)"],
		desc = L["Enter item ID to enable spell when the item is equipped only"],
		order = 10,
		type = "input",
		get = getterItem,
		set = setterItem,
	},
	item2 = {
		disabled = disableItem2,
		hidden = hideOnClass,
		name = L["Item ID (Optional)"] .. " 2",
		order = 11,
		type = "input",
		get = getterItem,
		set = setterItem,
	},
	lb4 = {
		hidden = hideOnClass,
		name = "\n" .. L["Toggle \"Show Spell ID in Tooltips\" to retrieve item IDs"],
		order = 12,
		type = "description",
		fontSize = "small",
	},
	buff = {
		hidden = disableOnNoHighlights,
		name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t" .. L["Buff ID (Optional)"],
		desc = L["Enter buff ID if it differs from spell ID for Highlights to work"],
		order = 13,
		type = "input",
		get = getterBuff,
		set = setterBuff,
	},
}

for i = 1, #specIDs do
	local specID = specIDs[i]
	local _, name, _, icon = GetSpecializationInfoByID(specID)

	customSpellInfo["spec" .. specID] = {
		hidden = hideSpec,
		icon = icon,
		name = name,
		type = "group",
		get = getterSpec,
		set = setterSpec,
		args = {
			enabled = {
				name = ENABLE,
				desc = L["Enable spell for this specialization"],
				order = 1,
				type = "toggle",
				get = getterSpecEnabled,
				set = setterSpecEnabled,
			},
			hd1 = {
				name = "", order = 2, type = "header",
			},
			duration = {
				name = L["Cooldown"],
				desc = L["Set to override the global cooldown setting for this specialization"],
				order = 3,
				type = "range",
				min = 1, max = 999, softMax = 300, step = 1,
			},
			charges = {
				name = L["Charges"],
				order = 4,
				type = "range",
				min = 1, max = 10, step = 1,
			},
		},
	}
end

local spellEditor = {
	name = L["Spell Editor"],
	order = 40,
	type = "group",
	get = function(info)
		local option = info[#info]
		local id = E.GetSpellID(info)
		if id then
			return OmniCDDB.cooldowns[id][option]
		end
	end,
	set = function(info, value)
		local option = info[#info]
		local id = E.GetSpellID(info)
		OmniCDDB.cooldowns[id][option] = value

		E:AddCustomSpells()
	end,
	args = {
		spellId = {
			order = 10,
			name = L["Spell ID"],
			type = "input",
			set = function(info, value)
				local id = tonumber(value)
				local name = GetSpellInfo(id)

				if not id or not name or strlen(value) > 9 then
					E.Write(L["Invalid ID"])
					return
				end

				if id == 102793 or id == 107574 then -- TODO: remove exception for Ursol's vertex, Avatar
					E.Write(L["Cannot edit protected spell"] .. " |cffffd700" .. name)
					return
				end

				if OmniCDDB.cooldowns[id] then
					LibStub("AceConfigDialog-3.0"):SelectGroup(E.AddOn, "spellEditor", "spell" .. value)
					return
				end

				local class, i = GetClassIndexBySpellID(id)
				local _, icon = GetSpellTexture(id)

				if class and i then
					OmniCDDB.cooldowns[id] = E.spellList[class][i]
					if type(OmniCDDB.cooldowns[id].duration) == "number" then
						OmniCDDB.cooldowns[id].duration = { default = OmniCDDB.cooldowns[id].duration }
					end
					if type(OmniCDDB.cooldowns[id].charges) ~= "table" then
						OmniCDDB.cooldowns[id].charges = { default = OmniCDDB.cooldowns[id].charges or 1 }
					end
				else
					OmniCDDB.cooldowns[id] = {
						["spellID"] = id,
						["duration"] = {default = 30},
						["type"] = "all",
						["charges"] = {default = 1},
						["icon"] = icon, ["class"] = "ALL", ["custom"] = true,
						["buff"] = id,
					}
				end

				E.options.args.spellEditor.args["spell" .. id] = {
					icon = icon,
					name = name,
					type = "group",
					args = customSpellInfo,
				}

				E:AddCustomSpells()
			end,
		},
		tooltipID = {
			order = 20,
			name = L["Show Spell ID in Tooltips"],
			width = "double",
			type = "toggle",
			get = function() return E.DB.profile.tooltipID end,
			set = function(_, state)
				E.DB.profile.tooltipID = state
				E.TooltipID:SetHooks()
			end,
		},
	},
}

function E:AddSpellEditor()
	for id in pairs(OmniCDDB.cooldowns) do
		if not C_Spell.DoesSpellExist(id) then
			OmniCDDB.cooldowns[id] = nil
			E.Write("Removing Invalid ID: |cffffd700" .. id)
		else
			local _, icon = GetSpellTexture(id)
			local name = GetSpellInfo(id)

			spellEditor.args["spell" .. id] = {
				icon = icon,
				name = name,
				type = "group",
				args = customSpellInfo,
			}
		end
	end

	self.options.args["spellEditor"] = spellEditor

	self:AddSpellPickers()
end
