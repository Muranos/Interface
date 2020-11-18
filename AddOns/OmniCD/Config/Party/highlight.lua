local E, L, C = select(2, ...):unpack()

local P = E["Party"]

local markedDesc = ""

for k, v in pairs(E.bigSpells) do
	local name = GetSpellInfo(k)
	name = format("|T%s:14:14:0:0:64:64:4:60:4:60|t %s, ", v, name)
	markedDesc = strjoin("", markedDesc, name)
end

local highlight = {
	name = L["Highlight"],
	order = 40,
	type = "group",
	get = function(info) local option = info[#info] return E.db.highlight[option] end,
	set = function(info, value) local option = info[#info] E.db.highlight[option] = value P:Refresh() end,
	args = {
		glow = {
			name = L["Glow Icons"],
			desc = L["Display a glow animation around an icon when it is activated"],
			order = 10,
			type = "group",
			inline = true,
			args = {
				glow = {
					order = 1,
					name = ENABLE,
					desc = L["Display a glow animation around an icon when it is activated"],
					type = "toggle",
				},
			}
		},
		glowBuffTypes = {
			disabled = function() return not E.db.highlight.glowBuffs end,
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
				--[[
				anim = {
					name = "Animate",
					desc = "Enable initial spark and marching-ants animation",
					order = 2,
					type = "toggle",
				},
				]]
				buffType = {
					name = TYPE,
					order = 3,
					type = "multiselect",
					values = E.L_HIGHLIGHTS,
					get = function(_, key) return E.db.highlight.glowBuffTypes[key] end,
					set = function(_, key, value) E.db.highlight.glowBuffTypes[key] = value P:Refresh() end,
				},
			}
		},
		markEnhanced = {
			name = L["Mark Enhanced Spells"],
			order = 30,
			type = "group",
			inline = true,
			args = {
				markEnhanced = {
					name = ENABLE,
					desc = L["Mark icons with a red dot to indicate enhanced spells"] .. "\n\n" .. markedDesc,
					order = 1,
					type = "toggle",
					set = function(_, value) E.db.highlight.markEnhanced = value P:ConfigIcons("markEnhanced") end,
				},
			}
		},
	}
}

P.options.args["highlight"] = highlight
