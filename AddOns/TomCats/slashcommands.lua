local addonName, addon = ...

local function toggleButton(buttonName)
	TomCats_Account[buttonName].preferences.hideButton = not TomCats_Account[buttonName].preferences.hideButton
	if (TomCats_Account[buttonName].preferences.hideButton) then
		addon[buttonName].charm:Hide()
		ChatFrame1:AddMessage(("|cffffff00 %s button disabled|r"):format(buttonName))
	else
		addon[buttonName].charm:Show()
		ChatFrame1:AddMessage(("|cffffff00 %s button enabled|r"):format(buttonName))
	end
end

local function handleSlashCommand(msg)
	if (not msg or msg == "") then
		ChatFrame1:AddMessage("|cffffff00 type /TOMCATS ? for more commands|r")
		ChatFrame1:AddMessage("|cffffff00 TomCat's Tours active components:|r")
		ChatFrame1:AddMessage("|cffffff00   *NEW* Lunar Festival (see minimap icon)|r")
		ChatFrame1:AddMessage("|cffffff00   *NEW* Love is in the Air (see minimap icon)|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Arathi Highlands|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Darkshore|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Nazjatar|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Mechagon|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Uldum|r")
		ChatFrame1:AddMessage("|cffffff00   Rares of Vale of Eternal Blossoms|r")
		ChatFrame1:AddMessage("|cffffff00   *Coming Soon* Shadowlands Rares|r")
		ChatFrame1:AddMessage("|cffffff00   *Coming Soon* Even more rares!|r")
		ChatFrame1:AddMessage("|cffff8000 Be sure to stop by https://twitch.tv/TomCat and say hi!|r")
	end
	msg = string.lower(msg)
	if (msg == "?" or msg == "help") then
		ChatFrame1:AddMessage("|cffffff00 Available commands:|r")
		ChatFrame1:AddMessage("|cffffff00 /TOMCATS MINIMAP|r")
		ChatFrame1:AddMessage("|cffffff00 (toggles minimap icons)|r")
	end
	if (msg == "minimap" or msg == "minimap ?" or msg == "minimap help") then
		ChatFrame1:AddMessage("|cffffff00 Toggle Minimap Icons (usage):|r")
		ChatFrame1:AddMessage("|cffffff00 /TOMCATS MINIMAP LUNARFESTIVAL|r")
		ChatFrame1:AddMessage("|cffffff00 /TOMCATS MINIMAP LOVE|r")
	end
	if (msg == "minimap lunarfestival") then
		toggleButton("lunarfestival")
	end
	if (msg == "minimap love") then
		toggleButton("loveisintheair")
	end
end

SLASH_TOMCATS1 = "/TOMCATS"
SLASH_TOMCATS2 = "/TOMCAT"
SlashCmdList["TOMCATS"] = handleSlashCommand
