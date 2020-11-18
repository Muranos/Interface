local E, L, C = select(2, ...):unpack()

local P = E["Party"]

local general = {
	name = GENERAL,
	order = 10,
	type = "group",
	get = function(info) local option = info[#info] return E.db.general[option] end,
	set = function(info, value) local option = info[#info] E.db.general[option] = value P:Refresh() end,
	args = {
		--[[
		resetModule = {
			name = RESET,
			desc = RESET_TO_DEFAULT,
			order = 0.9,
			type = "execute",
			func = "ResetOptions",
			handler = P,
			arg = "general",
			confirm = E.ConfirmAction,
		},
		--]]
		showAnchor = {
			name = L["Show Anchor"],
			desc = L["Show anchor with party/raid numbers"],
			order = 1,
			type = "toggle",
			set = function(_, value) E.db.general.showAnchor = value P:ConfigBars("showAnchorOrlocked") end,
		},
		player = {
			name = L["Show Player"],
			desc = L["Show player's spell bar"],
			order = 2,
			type = "toggle",
		},
		tooltip = {
			name = L["Show Tooltip"],
			desc = L["Show spell information when you mouseover an icon"] .. ". " .. L["Disable to make the icons click through"],
			order = 3,
			type = "toggle",
			set = function(_, value) E.db.general.tooltip = value P:ConfigIcons("tooltip") end,
		},
		loginMsg = {
			name = L["Login Message"],
			order = 4,
			type = "toggle",
			set = function(_, value) E.db.general.loginMsg = value end,
		},
		lb1 = {
			name = "\n\n |cffffd700" .. BATTLEGROUNDS,
			order = 5,
			type = "description",
			fontSize = "medium",
		},
		bgTrinket = {
			name = L["Show Trinket Only"],
			desc = L["Show pvp trinket only while in Battlegrounds"],
			order = 6,
			type = "toggle",
		},
	}
}

P.options.args["general"] = general
