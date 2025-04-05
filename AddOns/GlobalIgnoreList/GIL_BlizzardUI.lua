-----------------------
-- BLIZZARD UI HOOKS --
-----------------------

local _, L = ...

--------------------
-- LFG TOOL HACKS --
--------------------

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

function GIL_LFG_ApplicantMenu(owner, root, contextData)
	if not owner or not owner.resultID then return end
	
	local info = C_LFGList.GetSearchResultInfo(owner.resultID);
	
	if not info.leaderName or info.leaderName == "" then return end
	
	local target = addServer(info.leaderName)
	local text   = ""
	
	if (hasGlobalIgnored(target) > 0) then
		text = L["RCM_4"]				
	else
		text = L["RCM_6"]
	end	
	
	local leaderText = format(L["RCM_7"], target)
	
	root:CreateDivider()
	root:CreateTitle(leaderText)
	root:CreateButton(text,
		function(owner, root, contextData)
			C_FriendList.AddOrDelIgnore(addServer(info.leaderName))
			GILUpdateUI(true)
		end)	
end

----------------------
-- UNIT MENU- HACKS --
----------------------

function GIL_UnitMenuPlayer (owner, root, contextData)
	local target, server = UnitName(contextData.unit)

	if server == nil or server == "" then
		target = addServer(target)
	else
		target = target .. "-" .. server
	end

	target = Proper(target, true)

	local text = ""
	
	if (hasGlobalIgnored(addServer(target)) > 0) then
		text = L["RCM_4"]				
	else
		text = L["RCM_6"]
	end	

	root:CreateDivider()
	root:CreateButton(text,
		function(owner, root, contextData)
			C_FriendList.AddOrDelIgnore(addServer(target))
			GILUpdateUI(true)
		end)
end

-----------------------
-- ADDON COMPARTMENT --
-----------------------

AddonCompartmentFrame:RegisterAddon({
	text = "Global Ignore List",
	icon = "Interface\\Icons\\ui_chat.blp",
	notCheckable = true,
	func = function(button, menuInputData, menu)
		GIL_GUI()
	end,
})

--------------
-- UI HOOKS --
--------------

function GIL_HookFunctions()
	-- /script Menu.PrintOpenMenuTags()
		
	if GlobalIgnoreDB.useLFGHacks == true then
		hooksecurefunc("LFGListSearchEntry_Update", GIL_LFG_Update)
		hooksecurefunc("LFGListSearchEntry_OnEnter", GIL_LFG_Tooltip)	
		
		Menu.ModifyMenu("MENU_LFG_FRAME_SEARCH_ENTRY", GIL_LFG_ApplicantMenu)
	end
	
	if GlobalIgnoreDB.useUnitHacks == true then
		Menu.ModifyMenu("MENU_UNIT_ENEMY_PLAYER", GIL_UnitMenuPlayer)
		Menu.ModifyMenu("MENU_UNIT_PLAYER", GIL_UnitMenuPlayer)
		Menu.ModifyMenu("MENU_UNIT_PARTY", GIL_UnitMenuPlayer)
		Menu.ModifyMenu("MENU_UNIT_RAID_PLAYER", GIL_UnitMenuPlayer)
	end
end
