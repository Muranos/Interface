-----------------------
-- BLIZZARD UI HOOKS --
-----------------------

local _, L = ...

-----------------------------
-- UNIT AND CHAT MENU HOOK --
-----------------------------

local function getButtonElement (list, name)
	for index, value in ipairs(list) do
		if (type(value) == "string") and (value == "IGNORE") then
			return index
		end
	end
	
	return -1
end

local function GilUnitMenu (dropdownMenu, which, unit, name, userData, ...)

	if (UIDROPDOWNMENU_MENU_LEVEL > 1) then
		return
	end
	
	if (which and (which == "FRIEND")) then
		
		local info = UIDropDownMenu_CreateInfo()
				
		info.dist = 0
		info.notCheckable = 1	
		info.func = function() C_FriendList.AddOrDelIgnore(addServer(name)) GILUpdateUI(true) end
			
		if (hasGlobalIgnored(addServer(name)) > 0) then
			info.text = L["RCM_4"]					
		else
			info.text = L["RCM_6"]
		end	
				
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		
	elseif (which and (which == "PLAYER" or which == "RAID_PLAYER" or which == "PARTY" or which == "TARGET")) then
		
		local target, server = UnitName(unit or "target")
			
		if server then
			if server == "" then
				addServer(target)
			else
				target = target .. "-"..server
			end
		end
		
		target = Proper(target, true)
		
		DropDownList1.numButtons = max(0, DropDownList1.numButtons - 1)

		local info = UIDropDownMenu_CreateInfo()
		info.text = ""
		info.notCheckable = true
		info.disabled = true
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)	

		local info = UIDropDownMenu_CreateInfo()
				
		info.dist = 0
		info.notCheckable = 1
		
		if name and name == RAID_TARGET_ICON then
			info.func = function() AddOrDelNPC("") GILUpdateUI(true) end
				
			if (hasNPCIgnored(target) > 0) then
				info.text = L["RCM_4"]
			else
				info.text = L["RCM_6"]
			end

		else
			info.func = function() C_FriendList.AddOrDelIgnore(addServer(target)) GILUpdateUI(true) end
			
			if (hasGlobalIgnored(addServer(target)) > 0) then
				info.text = L["RCM_4"]				
				
			else
				info.text = L["RCM_6"]
			end	
		end
		
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		
		local info = UIDropDownMenu_CreateInfo()
		info.text = L["RCM_5"]
		info.dist = 0
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
	end
end

--------------------
-- LFG TOOL HACKS --
--------------------

local LFGMenu	= nil
local LFGLeader	= ""

function GIL_GetPlaystyleString (playstyle, activityInfo)

	if activityInfo and playstyle ~= (0 or nil) and C_LFGList.GetLfgCategoryInfo(activityInfo.categoryID).showPlaystyleDropdown then
		local typeStr
		
		if activityInfo.isMythicPlusActivity then
			typeStr = "GROUP_FINDER_PVE_PLAYSTYLE"
		elseif activityInfo.isRatedPvpActivity then
			typeStr = "GROUP_FINDER_PVP_PLAYSTYLE"
		elseif activityInfo.isCurrentRaidActivity then
			typeStr = "GROUP_FINDER_PVE_RAID_PLAYSTYLE"
		elseif activityInfo.isMythicActivity then
			typeStr = "GROUP_FINDER_PVE_MYTHICZERO_PLAYSTYLE"
		end
    
		return typeStr and _G[typeStr .. tostring(playstyle)] or nil
	else
		return nil
	end
end

--C_LFGList.GetPlaystyleString = function (playstyle, activityInfo)
--	return GIL_GetPlaystyleString (playstyle, activityInfo)
--end

--LFGListEntryCreation_SetTitleFromActivityInfo = function(_) end

function GIL_LFG_Refresh()
	if LFGListFrame.SearchPanel ~= nil and LFGListFrame.SearchPanel:IsShown() then
		LFGListSearchPanel_UpdateResults(LFGListFrame.SearchPanel)
	end
end

function GIL_LFG_Update (self)

	if not C_LFGList.HasSearchResultInfo(self.resultID) then return end
	
	local info = C_LFGList.GetSearchResultInfo(self.resultID);
	
	if (info ~= nil and hasGlobalIgnored(Proper(addServer(info.leaderName))) > 0) then
		self.Name:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
	end	
end

function GIL_LFG_Tooltip (self)

	if not C_LFGList.HasSearchResultInfo(self.resultID) then return end
	
	local info = C_LFGList.GetSearchResultInfo(self.resultID);
	
	if (info ~= nil and info.leaderName ~= nil) then
		local idx = hasGlobalIgnored(Proper(addServer(info.leaderName)))
		
		if (idx > 0) then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|c00ff0000" .. L["RCM_8"])
		
			local notes = (GlobalIgnoreDB.notes[idx] or "")
				
			if (notes ~= "") then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("|cffffffff" .. L["RCM_9"])
				GameTooltip:AddLine("|cff69CCF0"..notes)
			end
		
			GameTooltip:Show()
		end
	end
end

local function GIL_EasyMenu (menu, frame, anchor, x, y, display)
	if (frame ~= LFGListFrameDropDown or (anchor.resultID == nil)) then return end
	
	local info = C_LFGList.GetSearchResultInfo(anchor.resultID)

	if (info ~= nil and info.leaderName ~= nil) then
		LFGLeader = info.leaderName
	else
		LFGLeader = ""
		return
	end
	
	local idx = hasGlobalIgnored(Proper(addServer(LFGLeader)))
	local ignoreText = L["RCM_6"]
	local leaderText = format(L["RCM_7"], LFGLeader)
	
	if (idx > 0) then
		ignoreText = L["RCM_4"]
	end
	
	if LFGMenu == nil then
		LFGMenu = CreateFrame("Frame", "GIL_LFGMenu", UIParent, "BackdropTemplate")
		
		LFGMenu:SetBackdrop ({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			edgeSize = 16,
			insets = { left = 4, right = 4, top = 4, bottom = 4 },
		})
		
		LFGMenu:SetBackdropColor(0, 0, .1, .65)
		LFGMenu:SetFrameStrata("DIALOG")
		LFGMenu:EnableMouse(true)
		
		local t = LFGMenu:CreateFontString("GIL_LFGLeader", "ARTWORK", "GameFontHighlight")
		t:SetPoint("TOPLEFT", 14, -14)
		t:SetTextColor(YELLOW_FONT_COLOR:GetRGB())
		
		local b = CreateFrame("Button", "GIL_LFGButton", LFGMenu, "UIPanelButtonTemplate")
		b:SetPoint("TOPLEFT", t, 0, -20)
		b:SetScript("OnHide",
			function()
				if MouseIsOver(GIL_LFGButton) then
					C_FriendList.AddOrDelIgnore(LFGLeader)
					GIL_LFG_Refresh()
				end
			end)
	end
	
	GIL_LFGLeader:SetText(addServer(leaderText))
	GIL_LFGButton:SetText(ignoreText)
	
	local width = max(DropDownList1:GetWidth(), GIL_LFGLeader:GetStringWidth() + 40)

	LFGMenu:SetSize(width, 70)
	LFGMenu:SetPoint("TOPLEFT", DropDownList1, "BOTTOMLEFT")
	
	GIL_LFGButton:SetSize(max(22, width - 26), 22)
	
	DropDownList1:HookScript("OnHide", function() LFGMenu:Hide() end)

	LFGMenu:Show()
end

function GIL_HookFunctions()

	if GlobalIgnoreDB.useLFGHacks == true then
		hooksecurefunc("LFGListSearchEntry_Update", GIL_LFG_Update)
		hooksecurefunc("LFGListSearchEntry_OnEnter", GIL_LFG_Tooltip)
		hooksecurefunc("EasyMenu", GIL_EasyMenu)
	end
	
	if GlobalIgnoreDB.useUnitHacks == true then
		hooksecurefunc("UnitPopup_ShowMenu", GilUnitMenu)
	end
end