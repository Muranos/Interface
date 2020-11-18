local E, L, C = select(2, ...):unpack()

local P = E["Party"]

local isDetached = function() return E.db.position.detached end

local position = {
	name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t" .. L["Position"],
	order = 20,
	childGroups = "tab",
	type = "group",
	get = function(info) local option = info[#info] return E.db.position[option] end,
	set = function(info, value) local option = info[#info] E.db.position[option] = value P:Refresh() end,
	args = {
		detached = {
			name = L["Manual Mode"],
			desc = L["Detach from raid frames and set position manually"],
			order = 0,
			type = "toggle",
			set = function(_, state)
				E.db.position.detached = state

				if not state and E.customUF.active == "blizz" and not ( IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") ) then
					P:ConfirmReload(E.STR.BLIZZARD_CRF_DISABLED, true)
				end

				P:ConfigBars("detached") -- [48]
				P:ConfigSize()
				P:UpdatePosition()
			end,
		},
		uf = {
			hidden = function() return not E.customUF.enabled end,
			disabled = isDetached,
			name = ADDONS,
			desc = L["Select addon to override auto anchoring"],
			order = 1,
			type = "select",
			values = function() return E.customUF.optionTable end,
			set = function(_, value)
				-- TODO:
				if value == "blizz" and not E.db.position.detached and not ( IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") ) then
					E.db.position.uf = value
					P:ConfirmReload(E.STR.BLIZZARD_CRF_DISABLED, true)
				end

				if P.test then
					P:Test()
					E.db.position.uf = value
					E:SetActiveUnitFrameData()
					P:Test()
				else
					E.db.position.uf = value
					E:SetActiveUnitFrameData()
					P:Refresh()
				end
			end,
		},
	}
}

local getLayout = function(info)
	local k = info[#info-1]
	local option = info[#info]

	return E.db.position[k][option]
end

local setLayout = function(info, value)
	local k = info[#info-1]
	local option = info[#info]

	E.db.position[k][option] = value

	if option == "preset" then
		if value == "TOPLEFT" then
			E.db.position[k].anchor = "TOPRIGHT"
			E.db.position[k].attach = value
		elseif value == "TOPRIGHT" then
			E.db.position[k].anchor = "TOPLEFT"
			E.db.position[k].attach = value
		else
			E.db.position[k].anchor = E.db.position[k].anchorMore or "LEFT"
			E.db.position[k].attach = E.db.position[k].attachMore or "LEFT"
		end
	elseif option == "anchor" or option == "attach" then
		if E.db.position[k].preset == "manual" then
			E.db.position[k][option .. "More"] = value
		end
	end

	P:ConfigBars(option)
end

local hidePoints = function(info)
	local k = info[#info-1]
	return E.db.position[k].preset ~= "manual"
end

local hideColumns = function(info)
	local k = info[#info-1]
	return E.db.position[k].layout == "doubleRow"
end

local nameColumn = function(info)
	local k = info[#info-1]
	return E.db.position[k].layout == "vertical" and L["Rows"] or L["Columns"]
end

local descColumn = function(info)
	local k = info[#info-1]
	return E.db.position[k].layout == "vertical" and L["Set the number of icons per column"] or L["Set the number of icons per row"]
end

local hideBreakPoint = function(info)
	local k = info[#info-1]
	return E.db.position[k].layout ~= "doubleRow"
end

local nameBreakPoint = function(info)
	local k = info[#info-1]
	local spellType = ""
	for name, v in pairs(E.db.priority) do
		if E.db.position[k].breakPoint == v then
			spellType = E.L_PRIORITY[name]
			break
		end
	end

	return L["Row Breakpoint"] .. ": " .. spellType
end

local copyLayout = function(info, value)
	local k = info[#info-1]
	for option, value in pairs(E.db.position.arena) do
		E.db.position[k][option] = value
	end

	P:Refresh()
end

for k, v in pairs(E.CFG_GROUP_TYPE) do
	position.args[k] = {
		disabled = function() return E.db.position.arena.noTheme and (k == "party" or k == "raid") end,
		hidden = function() return not E.db.position.detached and k == "manual" or (E.db.position.detached and k ~= "manual") end,
		name = v[1],
		desc = v[3],
		order = v[2],
		type = "group",
		get = getLayout,
		set = setLayout,
		args = {
			lb1 = {
				name = "", order = 1, type = "description",
			},
			preset = {
				name = L["Position"],
				desc = L["Set the spell bar position"],
				order = 2,
				type = "select",
				values = E.L_PRESETS,
			},
			displayInactive = {
				name = L["Display Inactive Icons"],
				desc = L["Display icons not on cooldown"],
				order = 3,
				type = "toggle",
			},
			anchor = {
				hidden = hidePoints,
				name = L["Anchor Point"],
				desc = L["Set the anchor point on the spell bar"] .. "\n\n|TInterface\\FriendsFrame\\InformationIcon:14:14:0:0|t " .. L["Having \"RIGHT\" in the anchor point, icons grow left, otherwise right"],
				order = 4,
				type = "select",
				values = E.L_POINTS,
			},
			attach = {
				hidden = hidePoints,
				name = L["Attachment Point"],
				desc = L["Set the anchor attachment point on the party/raid frame"],
				order = 5,
				type = "select",
				values = E.L_POINTS,
			},
			offsetX = {
				name = L["Offset X"],
				desc = E.STR.MAX_RANGE,
				order = 6,
				type = "range",
				min = -999, max = 999, softMin = -100, softMax = 100, step = 1,
			},
			offsetY = {
				name = L["Offset Y"],
				desc = E.STR.MAX_RANGE,
				order = 7,
				type = "range",
				min = -999, max = 999, softMin = -100, softMax = 100, step = 1,
			},
			lb2 = {
				name = "\n", order = 8, type = "description",
			},
			layout = {
				name = L["Layout"],
				desc = L["Select your default party frame layout"],
				order = 9,
				type = "select",
				values = E.L_LAYOUT,
			},
			breakPoint = {
				hidden = hideBreakPoint,
				name = nameBreakPoint,
				desc = L["Select the highest priority spell type to use as the start of the 2nd row"],
				order = 10,
				type = "range",
				min = 0, max = 10, step = 1,
			},
			columns = {
				hidden = hideColumns,
				name = nameColumn,
				desc = descColumn,
				order = 11,
				type = "range",
				min = 1, max = 100, softMax = 20, step = 1,
			},
			growUpward = {
				name = L["Grow Rows Upward"],
				desc = L["Toggle the grow direction of icon rows"],
				order = 12,
				type = "toggle",
			},
		}
	}
end

position.args.arena.args["noTheme"] = {
	name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t" .. L["Use this setting for all group sizes"],
	order = 0,
	type = "toggle",
	width = "full",
}

position.args.party.args["copy"] = {
	name = L["Copy Default"],
	order = 0,
	type = "execute",
	func = copyLayout,
}

position.args.raid.args["copy"] = {
	name = L["Copy Default"],
	order = 0,
	type = "execute",
	func = copyLayout,
}

position.args.manual.args["locked"] = {
	name = function() return E.db.position.locked and UNLOCK_FRAME or LOCK_FRAME end,
	order = 0,
	type = "execute",
	func = function()
		E.db.position.locked = not E.db.position.locked
		E.options.args.Party.args.position.args.manual.args.locked.name = E.db.position.locked and UNLOCK_FRAME or LOCK_FRAME
		P:ConfigBars("showAnchorOrlocked")
	end,
}

position.args.manual.args["reset"] = {
	name = RESET_POSITION,
	order = 0.1,
	type = "execute",
	func = function()
		wipe(E.db.manualPos)
		P:ConfigBars("reset")
	end,
	confirm = E.ConfirmAction,
}

P.options.args["position"] = position
