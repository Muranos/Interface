local E, L, C = select(2, ...):unpack()

local P = E["Party"]
local HIGHLIGHTING = HIGHLIGHTING:gsub(":", "")

local markEnhancedDesc = {}

for k, v in pairs(E.spell_marked) do
	if not C_Spell.DoesSpellExist(k) or (v ~= true and not C_Spell.DoesSpellExist(v)) then
		E.spell_marked[k] = nil
		--E.Write("Removing Invalid ID (Enhanced): |cffffd200" .. k)
	else
		local id = v == true and k or v
		local name = GetSpellInfo(id)
		local icon = GetSpellTexture(id)
		name = format("|T%s:18|t %s", icon, name)
		markEnhancedDesc[#markEnhancedDesc + 1] = name
	end
end
markEnhancedDesc = E.FormatConcat(markEnhancedDesc, "%s\n")

local highlight = {
	name = HIGHLIGHTING,
	order = 35,
	type = "group",
	get = function(info) return E.DB.profile.Party[info[2]].highlight[info[#info]] end,
	set = function(info, value)
		local key = info[2]
		E.DB.profile.Party[key].highlight[info[#info]] = value

		if E.db == E.DB.profile.Party[key] then
			P:Refresh()
		end
	end,
	args = {
		glow = {
			name = L["Glow Icons"],
			order = 10,
			type = "group",
			inline = true,
			args = {
				glow = {
					name = ENABLE,
					desc = L["Display a glow animation around an icon when it is activated"],
					order = 1,
					type = "toggle",
				},
			}
		},
		highlight = {
			disabled = function(info) return info[5] and not E.DB.profile.Party[info[2]].highlight.glowBuffs end,
			name = L["Highlight Icons"],
			order = 20,
			type = "group",
			inline = true,
			args = {
				glowBuffs = {
					disabled = false,
					name = ENABLE,
					desc = L["Highlight the icon when a buffing spell is used until the buff falls off"],
					order = 1,
					type = "toggle",
				},
				animate = {
					name = L["Animate"],
					desc = L["Enable initial spark and marching-ants animation"],
					order = 2,
					type = "toggle",
				},
				buffTypes = {
					name = L["Spell Types"],
					order = 3,
					type = "multiselect",
					get = function(info, k) return E.DB.profile.Party[info[2]].highlight.glowBuffTypes[k] end,
					set = function(info, k, value)
						local key = info[2]
						E.DB.profile.Party[key].highlight.glowBuffTypes[k] = value

						if E.db == E.DB.profile.Party[key] then
							P:Refresh()
						end
					end,
					values = E.L_HIGHLIGHTS,
					descStyle = "inline",
				},
			}
		},
		markEnhanced = {
			disabled = function(info) return E.DB.profile.Party[info[2]].highlight.markEnhanced end,
			name = L["Mark Enhanced Spells"],
			order = 30,
			type = "group",
			inline = true,
			args = {
				markEnhanced = {
					disabled = false,
					name = ENABLE,
					desc = L["Mark icons with a red dot to indicate enhanced spells"] .. "\n\n" .. markEnhancedDesc,
					order = 1,
					type = "toggle",
					get = P.getIcons,
					set = P.setIcons,
				},
				markedSpells = {
					name = L["Add Spells"],
					desc = L["%d: spellID.\n%d-%d: spellID-talentID (Mark spell if talent is selected)."] .. "\n\n" .. L["Use a semi-colon(;) to seperate multiple IDs."],
					order = 2,
					type = "input",
					multiline = 1,
					width = "full",
					get = function(info)
						return table.concat(E.DB.profile.Party[info[2]].highlight.markedSpells, ";")
					end,
					set = function(info, value)
						local key = info[2]
						local t = E.DB.profile.Party[key].highlight.markedSpells
						table.wipe(t)

						value = gsub(value, ("[^%d-;]"), "")
						local s, e, v = 1
						while true do
							s, e, v = strfind(value, "([^;]+)", s)
							if s == nil then break end
							s = e + 1
							local a, b = strsplit("-", v)
							if strlen(a) < 9 and C_Spell.DoesSpellExist(a) then
								a = tonumber(a)
								if not t[a] and not E.spell_marked[a] then
									if b then
										if strlen(b) < 9 and C_Spell.DoesSpellExist(b) then
											t[a] = tonumber(b)
											table.insert(t, v)
										end
									else
										t[a] = true
										table.insert(t, v)
									end
								end
							end
						end

						P:ConfigIcons(key, "markEnhanced")
					end,
				}
			}
		},
	}
}

function P:AddHighlightOption(key)
	P.options.args[key].args.highlight = highlight
end
