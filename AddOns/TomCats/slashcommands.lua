local addonName, addon = ...

local friendlyNames = {
	loveisintheair = "Love is in the Air",
	lunarfestival = "Lunar Festival"

}

local function toggleButton(buttonName)
	TomCats_Account[buttonName].preferences.hideButton = not TomCats_Account[buttonName].preferences.hideButton
	if (TomCats_Account[buttonName].preferences.hideButton) then
		addon[buttonName].charm:Hide()
		ChatFrame1:AddMessage(("|cffffff00 %s button disabled|r"):format(friendlyNames[buttonName]))
	else
		addon[buttonName].charm:Show()
		ChatFrame1:AddMessage(("|cffffff00 %s button enabled|r"):format(friendlyNames[buttonName]))
	end
end

local function handleSlashCommand(msg)
	local loveActive = addon.loveisintheair and addon.loveisintheair.IsEventActive()
	local lunarActive = addon.lunarfestival and addon.lunarfestival.IsEventActive()
	if (not msg or msg == "") then
		ChatFrame1:AddMessage("|cffffff00 TomCat's Tours active components:|r")
		if (lunarActive) then
			ChatFrame1:AddMessage("|cffffff00   *NEW* Lunar Festival (see minimap icon)|r")
		end
		if (loveActive) then
			ChatFrame1:AddMessage("|cffffff00   *NEW* Love is in the Air (see minimap icon)|r")
		end
		ChatFrame1:AddMessage("|cffffff00   Rares of Arathi Highlands|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Darkshore|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Nazjatar|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Mechagon|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Uldum|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Vale of Eternal Blossoms|r")
		ChatFrame1:AddMessage("|cffffff00   *Coming Soon* Shadowlands Rares|r")
		ChatFrame1:AddMessage("|cffffff00   *Coming Soon* Even more rares!|r")
		ChatFrame1:AddMessage("|cffff8000 Be sure to stop by https://twitch.tv/TomCat and say hi!|r")
		if (lunarActive or loveActive) then
			ChatFrame1:AddMessage("|cffffff00 For more commands, type /tomcats help|r")
		end
	end
	msg = string.lower(msg)
	if (lunarActive or loveActive) then
		if (msg == "?" or msg == "help") then
			ChatFrame1:AddMessage("|cffffff00 Available commands:|r")
			ChatFrame1:AddMessage("|cffffff00 Toggle minimap icons: /tomcats minimap [component]|r")
			ChatFrame1:AddMessage("|cffffff00 For examples: /tomcats minimap help|r")
		end
		if (msg == "minimap" or msg == "minimap ?" or msg == "minimap help") then
			ChatFrame1:AddMessage("|cffffff00 Toggle Minimap Icons (usage):|r")
			if (lunarActive) then
				ChatFrame1:AddMessage("|cffffff00  for Lunar Festival: /tomcats minimap lunar|r")
			end
			if (loveActive) then
				ChatFrame1:AddMessage("|cffffff00  for Love is in the Air: /tomcats minimap love|r")
			end
		end
		if (lunarActive) then
			if (msg == "minimap lunar") then
				toggleButton("lunarfestival")
			end
		end
		if (loveActive) then
			if (msg == "minimap love") then
				toggleButton("loveisintheair")
			end
		end
	end
end

SLASH_TOMCATS1 = "/TOMCATS"
SLASH_TOMCATS2 = "/TOMCAT"
SlashCmdList["TOMCATS"] = handleSlashCommand
