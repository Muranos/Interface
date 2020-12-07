local E, L, C = select(2, ...):unpack()

StaticPopupDialogs["OMNICD_Elv_MSG"] = {
	text = E.userClassHexColor .. "OmniCD:|r " .. L["Changing party display options in your UF addon while OmniCD is active will break the anchors. Type (/oc rl) to fix the anchors"],
	button1 = OKAY,
	button3 = L["Don't show again"],
	OnAlt = function()
		E.DB.global.disableElvMsg = true
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = STATICPOPUP_NUMDIALOGS
}

StaticPopupDialogs["OMNICD_RELOADUI"] = {
	text = E.userClassHexColor .. "OmniCD:|r %s",
	OnAccept = function(_, data, data2)
		if data then
			EnableAddOn("Blizzard_CompactRaidFrames")
			EnableAddOn("Blizzard_CUFProfiles")
		end

		ReloadUI()
	end,
	OnCancel = function(_, data)
		if data and E.Party.test then E.Party:Test() end
	end,
	button1 = ACCEPT,
	button2 = CANCEL,
	timeout = 0,
	whileDead = true,
	hideOnEscape = false,
	preferredIndex = STATICPOPUP_NUMDIALOGS
}
