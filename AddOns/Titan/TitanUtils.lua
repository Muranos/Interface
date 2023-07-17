--[[ File
NAME: TitanUtils.lua
DESC: This file contains various utility routines used by Titan and routines available to plugin developers.
--]]

local _G = getfenv(0);
local L = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)
local media = LibStub("LibSharedMedia-3.0")

-- The LibUIDropDownMenu lib is used over the Blizzard frame
local drop_down_1 = "DropDownList1" -- Boo!! Per hard-coded Blizz UIDropDownMenu.lua
--
-- The routines labeled API are useable by addon developers
--

--[[ API
NAME: TitanUtils_GetBarAnchors
DESC: Get the anchors of the bottom most top bar and the top most bottom bar.
   Intended for addons that modify the UI so they can adjust for Titan.
   The anchors adjust depending on what Titan bars the user displays.
:DESC
VAR:  None
OUT: frame - TitanPanelTopAnchor frame reference - Titan uses the space ABOVE this
OUT: frame - TitanPanelBottomAnchor frame reference - Titan uses the space BELOW this
NOTE:
-  The two anchors are implemented as 2 frames that are moved by Titan depending on which bars are shown.
:NOTE
--]]
function TitanUtils_GetBarAnchors() -- Used by addons
	return TitanPanelTopAnchor, TitanPanelBottomAnchor
end

--------------------------------------------------------------
--
-- Plugin button search & manipulation routines
--
--[[ API
NAME: TitanUtils_GetButton
DESC: Create thebutton name from plugin id.
VAR: id - is the id of the plugin
OUT: string - The button / frame name
--]]
function TitanUtils_ButtonName(id)
	if (id) then
		return Titan_Panel.plugin.PRE..id..Titan_Panel.plugin.POST
	else
		return nil
	end
end

--[[ API
NAME: TitanUtils_GetButton
DESC: Return the actual button frame and the plugin id.
VAR: id - is the id of the plugin
OUT: frame - The button table
OUT: string - The id of the plugin
--]]
function TitanUtils_GetButton(id) -- Used by plugins
	if (id) then
		return _G[Titan_Panel.plugin.PRE..id..Titan_Panel.plugin.POST], id;
	else
		return nil, nil;
	end
end

--[[ API
NAME: TitanUtils_GetRealPosition
DESC: Return whether the plugin is on the top or bottom bar.
VAR: id - is the id of the plugin
OUT: bottom(2) or top(1)-default
NOTE:
- This returns top or bottom NOT which bar (1-4) the plugin is on.
:NOTE
--]]
function TitanUtils_GetRealPosition(id) -- Used by plugins
	-- This will return top / bottom but it is a compromise.
	-- With the introduction of independent bars there is
	-- more than just top / bottom.
	-- This should work in the sense that the plugins using this
	-- would overlap the double bar.
	local bar = TitanUtils_GetWhichBar(id)
	local bar_pos = nil
	for idx,v in pairs (TitanBarData) do
		if bar == TitanBarData[idx].name then
			bar_pos = TitanBarData[idx].vert
		end
	end
	return (bar_pos == TITAN_BOTTOM and TITAN_PANEL_PLACE_BOTTOM or TITAN_PANEL_PLACE_TOP)
end

--[[ API
NAME: TitanUtils_GetButtonID
DESC: Return the plugin id of the given name. This can be used to see if a plugin exists.
VAR: name - is the id of the plugin
OUT: string - plugin id or nil
--]]
function TitanUtils_GetButtonID(name)
	if name then
		local s, e, id = string.find(name, Titan_Panel.plugin.PRE.."(.*)"..Titan_Panel.plugin.POST);
		return id;
	else
		return nil;
	end
end

--[[ API
NAME: TitanUtils_GetParentButtonID
DESC: Return the plugin id of the parent of the given name, if it exists.
VAR: name - is the id of the plugin
OUT: string - plugin id or nil
--]]
function TitanUtils_GetParentButtonID(name)
	local frame = TitanUtils_Ternary(name, _G[name], nil);

	if ( frame and frame:GetParent() ) then
		return TitanUtils_GetButtonID(frame:GetParent():GetName());
	end
end

--[[ API
NAME: TitanUtils_GetButtonIDFromMenu
DESC: Return the plugin id of whatever the mouse is over. Used in the right click menu on load.
VAR: self - is the id of the frame
OUT: string - plugin id or nil
NOTE:
- The plugin id returned could be the Titan bar or a plugin or nil.
:NOTE
--]]
function TitanUtils_GetButtonIDFromMenu(self)
	local ret = nil
	if self and self:GetParent() then
		local name = self:GetParent():GetName()
		if name == "UIParent" then
			-- The click was on the Titan bar itself
			ret = "Bar";
		elseif self:GetParent():GetParent():GetName() then
			local pname = self:GetParent():GetParent():GetName()
			-- TitanPanelChildButton
			-- expecting this to be a TitanPanelChildButtonTemplate
			temp = TitanUtils_GetButtonID(pname)
			if temp then
				-- should be ok
				ret = temp
			else
				-- the frame container is expected to be without a name
				-- This trips when the user right clicks a LDB plugin...
			end
		else
			-- TitanPanelButton
			temp = TitanUtils_GetButtonID(self:GetParent():GetName())
			if temp then
				-- should be ok
				ret = temp
			else
				TitanDebug("Could not determine Titan ID for '"
				..(self:GetParent():GetParent() or "?").."'. "
				,"error")
			end
		end
	end

	return ret
end

--[[ API
NAME: TitanUtils_GetPlugin
DESC: Return the plugin itself (table and all).
VAR: id - is the id of the plugin
OUT: table - plugin or nil
--]]
function TitanUtils_GetPlugin(id)
	if (id) then
		return TitanPlugins[id];
	else
		return nil;
	end
end

--[[ API
NAME: TitanUtils_GetWhichBar
DESC: Return the bar the plugin is shown on.
VAR: id - is the id of the plugin
OUT: string - internal bar name or nil
OUT: string - locale bar name or nil
--]]
function TitanUtils_GetWhichBar(id)
	local i = TitanPanel_GetButtonNumber(id);
	if TitanPanelSettings.Location[i] == nil then
		return nil, nil
	else
		local internal = TitanPanelSettings.Location[i]
		local locale = ""
		for _,v in pairs (TitanBarData) do
			if v.name == internal then
				locale = v.locale_name
			else
				-- not the Bar wanted
			end
		end
		return internal, locale
	end
end

--[[ API
NAME: TitanUtils_PickBar
DESC: Return the first bar that is shown.
VAR:  None
OUT: string - bar name or nil
--]]
function TitanUtils_PickBar()
	-- Pick the 'first' bar shown per the Titan defined order.
	-- This is used for defaulting where plugins are put
	-- if using the Titan options screen.
	local bar_list = {}
	for _,v in pairs (TitanBarData) do
		bar_list[v.order] = v
	end
	table.sort(bar_list, function(a, b)
		return a.order < b.order
	end)

	for idx = 1, #bar_list do
		local bar_name = bar_list[idx].name
		if TitanBarDataVars[bar_list[idx].frame_name].show then --if TitanPanelGetVar(bar_name.."_Show") then
			return bar_name
		end
	end
	-- fail safe - return something
	return nil
end

--[[ API
NAME: TitanUtils_ToRight
DESC: See if the plugin is to be on the right.
   These are the methods to place a plugin on the right:
   1) DisplayOnRightSide saved variable logic (preferred)
   2) Place a plugin in TITAN_PANEL_NONMOVABLE_PLUGINS (NOT preferred)
:DESC
VAR:  None
OUT: bool - true or nil. true if the plugin is to be placed on the right side of a bar.
NOTE:
- Using the Titan template TitanPanelIconTemplate used to enforce right side only but was removed during DragonFlight to give users more flexibility.
:NOTE
--]]
function TitanUtils_ToRight(id)
	local found = nil
	for index, _ in ipairs(TITAN_PANEL_NONMOVABLE_PLUGINS) do
		if id == TITAN_PANEL_NONMOVABLE_PLUGINS[index] then
			found = true;
		end
	end

	if TitanGetVar(id, "DisplayOnRightSide") then
		found = true
	end

	return found
end

--------------------------------------------------------------
--
-- General util routines
--

--[[ API
NAME: TitanUtils_Ternary
DESC: Return b or c if true or false respectively
VAR: a - value to determine true or false
VAR: b - value to use if true
VAR: c - value to use if false or nil
OUT: value - b (true) or c (false)
--]]
function TitanUtils_Ternary(a, b, c) -- Used by plugins
	if (a) then
		return b;
	else
		return c;
	end
end

--[[ API
NAME: TitanUtils_Toggle
DESC: Flip the value assuming it is true or false
VAR: value - value to start with
OUT: bool - true or false
--]]
function TitanUtils_Toggle(value) -- Used by plugins
	if (value == 1 or value == true) then
		return nil;
	else
		return 1;
	end
end

--[[ API
NAME: TitanUtils_Min
DESC: Return the min of a or b
VAR: a - a value
VAR: b - a value
OUT:
- value of min (a, b)
--]]
function TitanUtils_Min(a, b)
	if (a and b) then
--		return ( a < b ) and a or b
		return TitanUtils_Ternary((a < b), a, b);
	end
end

--[[ API
NAME: TitanUtils_Max
DESC: Return the max of a or b
VAR: a - a value
VAR: b - a value
OUT: value - value of max (a, b)
--]]
function TitanUtils_Max(a, b)
	if (a and b) then
		return TitanUtils_Ternary((a > b), a, b);
---		return ( a > b ) and a or b
	end
end

--[[ API
NAME: TitanUtils_Round
DESC: Return the nearest integer
VAR: v - a value
OUT:
- value of nearest integer
--]]
function TitanUtils_Round(v)
	local f = math.floor(v)
	if v == f then
		return f
	else
		return math.floor(v + 0.5)
	end
end

--[[ local
NAME: GetTimeParts
DESC: Use the seconds (s) to return its parts.
VAR: s - a time value in seconds
OUT: int - days
OUT: int - hours
OUT: int - minutes
OUT: int - seconds
--]]
local function GetTimeParts(s)
	local days = 0
	local hours = 0
	local minutes = 0
	local seconds = 0
	if not s or (s < 0) then
		seconds = L["TITAN_NA"]
	else
		days = floor(s/24/60/60); s = mod(s, 24*60*60);
		hours = floor(s/60/60); s = mod(s, 60*60);
		minutes = floor(s/60); s = mod(s, 60);
		seconds = s;
	end

	return days, hours, minutes, seconds
end

--[[ API
NAME: TitanUtils_GetEstTimeText
DESC: Use the seconds (s) to return an estimated time.
VAR: s - a time value in seconds
OUT: string - string with localized, estimated elapsed time using spaces and leaving off the rest
--]]
function TitanUtils_GetEstTimeText(s)
	local timeText = "";
	local days, hours, minutes, seconds = GetTimeParts(s)
	local fracdays = days + (hours/24);
	local frachours = hours + (minutes/60);
	if seconds == L["TITAN_NA"] then
		timeText = L["TITAN_NA"];
	else
		if (days ~= 0) then
			timeText = timeText..format("%4.1f"..L["TITAN_DAYS_ABBR"].." ", fracdays);
		elseif (days ~= 0 or hours ~= 0) then
			timeText = timeText..format("%4.1f"..L["TITAN_HOURS_ABBR"].." ", frachours);
		elseif (days ~= 0 or hours ~= 0 or minutes ~= 0) then
			timeText = timeText..format("%d"..L["TITAN_MINUTES_ABBR"].." ", minutes);
		else
			timeText = timeText..format("%d"..L["TITAN_SECONDS_ABBR"], seconds);
		end
	end
	return timeText;
end

--[[ API
NAME: TitanUtils_GetFullTimeText
DESC: break the seconds (s) into days, hours, minutes, and seconds
VAR: s - a time value in seconds
OUT: string - string with localized days, hours, minutes, and seconds using commas and including zeroes
--]]
function TitanUtils_GetFullTimeText(s)
	local days, hours, minutes, seconds = GetTimeParts(s)
	if seconds == L["TITAN_NA"] then
		return L["TITAN_NA"];
	else
		return format("%d"..L["TITAN_DAYS_ABBR"]
			..", %2d"..L["TITAN_HOURS_ABBR"]
			..", %2d"..L["TITAN_MINUTES_ABBR"]
			..", %2d"..L["TITAN_SECONDS_ABBR"],
				days, hours, minutes, seconds);
	end
end

--[[ API
NAME: TitanUtils_GetAbbrTimeText
DESC: break the seconds (s) into days, hours, minutes, and seconds
VAR: s - a time value in seconds
OUT: string - string with localized days, hours, minutes, and seconds using spaces and including zeroes
--]]
function TitanUtils_GetAbbrTimeText(s) -- Used by plugins
	local timeText = "";
	local days, hours, minutes, seconds = GetTimeParts(s)
	if seconds == L["TITAN_NA"] then
		timeText = L["TITAN_NA"];
	else
		if (days ~= 0) then
			timeText = timeText..format("%d"..L["TITAN_DAYS_ABBR"].." ", days);
		end
		if (days ~= 0 or hours ~= 0) then
			timeText = timeText..format("%d"..L["TITAN_HOURS_ABBR"].." ", hours);
		end
		if (days ~= 0 or hours ~= 0 or minutes ~= 0) then
			timeText = timeText..format("%d"..L["TITAN_MINUTES_ABBR"].." ", minutes);
		end
		timeText = timeText..format("%d"..L["TITAN_SECONDS_ABBR"], seconds);
	end
	return timeText;
end

--[[ API
NAME: TitanUtils_GetControlFrame
DESC: return the control frame, if one was created.
VAR: id - id of the plugin
OUT: frame - nil or the control frame
NOTE
- This may not be used anymore.
:NOTE
--]]
function TitanUtils_GetControlFrame(id)
	if (id) then
		return _G["TitanPanel"..id.."ControlFrame"];
	else
		return nil;
	end
end

--[[ API
NAME: TitanUtils_TableContainsValue
DESC: Determine if the table contains the value.
VAR: table - table to search
VAR: value - value to find
OUT: int - nil or the index to value
--]]
function TitanUtils_TableContainsValue(table, value)
	if (table and value) then
		for i, v in pairs(table) do
			if (v == value) then
				return i;
			end
		end
	end
end

--[[ API
NAME: TitanUtils_TableContainsIndex
DESC: Determine if the table contains the index.
VAR: table - table to search
VAR: index - index to find
OUT: int - nil or the index
--]]
function TitanUtils_TableContainsIndex(table, index)
	if (table and index and table[index] ~= nil) then
		return index
	end
--[[
	if (table and index) then
		for i, v in pairs(table) do
			if (i == index) then
				return i;
			end
		end
	end
--]]
end

--[[ API
NAME: TitanUtils_GetCurrentIndex
DESC: Determine if the table contains the value.
VAR: table - table to search
VAR: value - value to find
OUT: int - nil or the index to value
--]]
function TitanUtils_GetCurrentIndex(table, value)
	return TitanUtils_TableContainsValue(table, value);
end

--[[ API
NAME: TitanUtils_PrintArray
DESC: Debug tool that will attempt to output the index and value of the array passed in.
VAR: array - array to output
OUT: table - Array output to the chat window
--]]
function TitanUtils_PrintArray(array)
	if (not array) then
		TitanDebug("array is nil");
	else
		TitanDebug("{");
		for i, v in array do
			TitanDebug("array[" .. tostring(i) .. "] = " .. tostring(v));
		end
		TitanDebug("}");
	end

end

--[[ API
NAME: TitanUtils_GetRedText
DESC: Make the given text red.
VAR: text - text to color
OUT: string - Red string with proper start and end font encoding
--]]
function TitanUtils_GetRedText(text) -- Used by plugins
	if (text) then
		return _G["RED_FONT_COLOR_CODE"]..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetGoldText
DESC: Make the given text gold.
VAR: text - text to color
OUT: string - Gold string with proper start and end font encoding
--]]
function TitanUtils_GetGoldText(text)
	if (text) then
		return "|cffffd700"..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetGreenText
DESC: Make the given text green.
VAR: text - text to color
OUT: string - Green string with proper start and end font encoding
--]]
function TitanUtils_GetGreenText(text) -- Used by plugins
	if (text) then
		return _G["GREEN_FONT_COLOR_CODE"]..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetBlueText
DESC: Make the given text blue.
VAR: text - text to color
OUT: string - Blue string with proper start and end font encoding
--]]
function TitanUtils_GetBlueText(text)
	if (text) then
		return "|cff0000ff"..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetNormalText
DESC: Make the given text normal (gray-white).
VAR: text - text to color
OUT: string - Normal string with proper start and end font encoding
--]]
function TitanUtils_GetNormalText(text) -- Used by plugins
	if (text) then
		return _G["NORMAL_FONT_COLOR_CODE"]..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetHighlightText
DESC: Make the given text highlight (brighter white).
VAR: text - text to color
OUT: string - Highlight string with proper start and end font encoding
--]]
function TitanUtils_GetHighlightText(text) -- Used by plugins
	if (text) then
		return _G["HIGHLIGHT_FONT_COLOR_CODE"]..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetColoredText
DESC: Make the given text a custom color.
VAR: text - text to color
VAR: color - color is the color table with r, b, g values set.
OUT: string - Custom color string with proper start and end font encoding
--]]
function TitanUtils_GetColoredText(text, color) -- Used by plugins
	if (text and color) then
		local redColorCode = format("%02x", color.r * 255);
		local greenColorCode = format("%02x", color.g * 255);
		local blueColorCode = format("%02x", color.b * 255);
		local colorCode = "|cff"..redColorCode..greenColorCode..blueColorCode;
		return colorCode..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetHexText
DESC: Make the given text a custom color.
VAR: text - text to color
VAR: hex - color as a 6 char hex code
OUT: string - Custom color string with proper start and end font encoding
--]]
function TitanUtils_GetHexText(text, hex) -- Used by plugins
	if (text and hex) then
		return "|cff"..tostring(hex)..text.._G["FONT_COLOR_CODE_CLOSE"];
	end
end

--[[ API
NAME: TitanUtils_GetThresholdColor
DESC: Flexable routine that returns the threshold color for a given value using a table as input.
VAR: ThresholdTable - table holding the list of colors and values
VAR: value -
OUT: string - The color value from the treshhold table
--]]
function TitanUtils_GetThresholdColor(ThresholdTable, value)
	if ( not tonumber(value) or type(ThresholdTable) ~= "table"
	or ThresholdTable.Values == nil or ThresholdTable.Colors == nil
	or table.getn(ThresholdTable.Values) >= table.getn(ThresholdTable.Colors)
	) then
		return _G["GRAY_FONT_COLOR"];
	end

	local n = table.getn(ThresholdTable.Values) + 1;
	for i = 1, n do
		local low = TitanUtils_Ternary(i == 1, nil, ThresholdTable.Values[i-1]); -- lowest
		local high = TitanUtils_Ternary(i == n, nil, ThresholdTable.Values[i]);  -- highest

		if ( not low and not high ) then
			-- No threshold values
			return ThresholdTable.Colors[i];

		elseif ( not low and high ) then
			-- Value is smaller than the first threshold
			if ( value < high ) then return ThresholdTable.Colors[i] end

		elseif ( low and not high ) then
			-- Value is larger than the last threshold
			if ( low <= value ) then return ThresholdTable.Colors[i] end

		else
			-- Value is in between 2 adjacent thresholds
			if ( low <= value and value < high ) then
				return ThresholdTable.Colors[i]
			end
		end
	end

	-- Should never reach here
	return _G["GRAY_FONT_COLOR"];
end

--[[ API
NAME: TitanUtils_ToString
DESC: Routine that returns the text or an empty string.
VAR: text - text to check
OUT: string - string of text or ""
--]]
function TitanUtils_ToString(text)
	return TitanUtils_Ternary(text, text, "");
end

--------------------------------------------------------------
--
-- Right click menu routines
--
--[[
Right click menu routines for plugins
The expected global function name in the plugin is:
"TitanPanelRightClickMenu_Prepare"..<registry.id>.."Menu"

This section abstracts the menu routines built into WoW.
Over time Titan used the menu routines written by Blizzard then a lib under Ace3. Currently back to the Blizzard routines.
Whenever there is a change to the menu routines, the abstractions allows us to update Utils rather than updating Titan using search & replace. It also helps insulate 3rd party Titan plugin authors from Blizz or lib changes.
--]]

--[[ API
NAME: TitanPanelRightClickMenu_GetDropdownLevel
DESC: Menu - Get the current level in the menus.
VAR: None
OUT:  int - dropdown menu level
--]]
function TitanPanelRightClickMenu_GetDropdownLevel()
	return UIDROPDOWNMENU_MENU_LEVEL
end

--[[ API
NAME: TitanPanelRightClickMenu_GetDropdMenuValue
DESC: Menu - Get the current value in the selected menu.
VAR: None
OUT:  int - dropdown menu value
--]]
function TitanPanelRightClickMenu_GetDropdMenuValue()
	return UIDROPDOWNMENU_MENU_VALUE
end

--[[ API
NAME: TitanPanelRightClickMenu_AddButton
DESC: Menu - add given info (button) at the given level in the form of a button.
VAR: info - text / button / command to show
VAR: level - level to put text
OUT:  None
--]]
function TitanPanelRightClickMenu_AddButton(info, level)
    if (info) then
        UIDropDownMenu_AddButton(info, level);
    end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddToggleRightSide
DESC: Menu - add a toggle Right Side (localized) command at the given level in the form of a button. Titan will properly control the "DisplayOnRightSide"
VAR: id - id of the plugin
VAR: level - level to put the line
OUT:  None
--]]
function TitanPanelRightClickMenu_AddToggleRightSide(id, level)
	local plugin = TitanUtils_GetPlugin(id)
	if plugin.controlVariables and plugin.controlVariables.DisplayOnRightSide then
		-- copy of TitanPanelRightClickMenu_AddToggleVar adding a remove button
		local info = {};
		info.text = L["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
		info.value = {id, "DisplayOnRightSide"};
		info.func = function()
			local bar = TitanUtils_GetWhichBar(id)
			TitanPanelRightClickMenu_ToggleVar({id, "DisplayOnRightSide"})
			TitanPanel_RemoveButton(id);
			TitanUtils_AddButtonOnBar(bar, id)
		end
		info.checked = TitanGetVar(id, "DisplayOnRightSide");
		info.keepShownOnClick = 1;
		UIDropDownMenu_AddButton(info, level);
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddTitle
DESC: Menu - add a title at the given level in the form of a button.
VAR: title - text to show
VAR: level - level to put text
OUT:  None
--]]
function TitanPanelRightClickMenu_AddTitle(title, level)
	if (title) then
		local info = {};
		info.text = title;
		info.notCheckable = true;
		info.notClickable = true;
		info.isTitle = 1;
		UIDropDownMenu_AddButton(info, level);
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddCommand
DESC: Menu - add a command at the given level in the form of a button.
VAR: title - text to show
VAR: value - value of the command
VAR: functionName - routine to run when clicked
VAR: level - level to put command
OUT:  None
--]]
function TitanPanelRightClickMenu_AddCommand(text, value, functionName, level)
	local info = {};
	info.notCheckable = true;
	info.text = text;
	info.value = value;
	info.func = function()
	local callback = _G[functionName];
-- callback must be a function else do nothing (spank developer)
		if callback and type(callback)== "function" then
			callback(value)
		end
	end
	UIDropDownMenu_AddButton(info, level);
end

--[[ API
NAME: TitanPanelRightClickMenu_AddSeparator
DESC: Menu - add a line at the given level in the form of an inactive button.
VAR: level - level to put the line
OUT: None
--]]
function TitanPanelRightClickMenu_AddSeparator(level)
	UIDropDownMenu_AddSeparator(level)
end

--[[ API
NAME: TitanPanelRightClickMenu_AddSpacer
DESC: Menu - add a blank line at the given level in the form of an inactive button.
VAR: level - level to put the line
OUT: None
--]]
function TitanPanelRightClickMenu_AddSpacer(level)
	UIDropDownMenu_AddSpace(level)
end

--[[ API
NAME: TitanPanelRightClickMenu_Hide
DESC: This will remove the plugin from the Titan bar.
VAR: value - id of the plugin
OUT: None
--]]
function TitanPanelRightClickMenu_Hide(value)
	TitanPanel_RemoveButton(value);
end

--[[ API
NAME: TitanPanelRightClickMenu_AddToggleVar
DESC: Menu - add a toggle variable command at the given level in the form of a button.
VAR: text - text to show
VAR: id - id of the plugin
VAR: var - the saved variable of the plugin to toggle
VAR: toggleTable - control table (called with other than nil??)
VAR: level - level to put the line
OUT:  None
--]]
function TitanPanelRightClickMenu_AddToggleVar(text, id, var, toggleTable, level)
	local info = {};
	info.text = text;
	info.value = {id, var, toggleTable};
	info.func = function()
		TitanPanelRightClickMenu_ToggleVar({id, var, toggleTable})
	end
	info.checked = TitanGetVar(id, var);
	info.keepShownOnClick = 1;
	UIDropDownMenu_AddButton(info, level);
end

--[[ API
NAME: TitanPanelRightClickMenu_AddToggleIcon
DESC: Menu - add a toggle Icon (localized) command at the given level in the form of a button. Titan will properly control the "ShowIcon"
VAR: id - id of the plugin
VAR: level - level to put the line
OUT:  None
--]]
function TitanPanelRightClickMenu_AddToggleIcon(id, level)
	local plugin = TitanUtils_GetPlugin(id)
	if plugin.controlVariables and plugin.controlVariables.ShowIcon then
		TitanPanelRightClickMenu_AddToggleVar(L["TITAN_PANEL_MENU_SHOW_ICON"], id, "ShowIcon", nil, level);
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddToggleLabelText
DESC: Menu - add a toggle Label (localized) command at the given level in the form of a button. Titan will properly control the "ShowLabelText"
VAR: id - id of the plugin
VAR: level - level to put the line
OUT:  None
--]]
function TitanPanelRightClickMenu_AddToggleLabelText(id, level)
	local plugin = TitanUtils_GetPlugin(id)
	if plugin.controlVariables and plugin.controlVariables.ShowLabelText then
		TitanPanelRightClickMenu_AddToggleVar(L["TITAN_PANEL_MENU_SHOW_LABEL_TEXT"], id, "ShowLabelText", nil, level);
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddToggleColoredText
DESC: Menu - add a toggle Colored Text (localized) command at the given level in the form of a button. Titan will properly control the "ShowColoredText"
VAR: id - id of the plugin
VAR: level - level to put the line
OUT:  None
--]]
function TitanPanelRightClickMenu_AddToggleColoredText(id, level)
	local plugin = TitanUtils_GetPlugin(id)
	if plugin.controlVariables and plugin.controlVariables.ShowColoredText then
		TitanPanelRightClickMenu_AddToggleVar(L["TITAN_PANEL_MENU_SHOW_COLORED_TEXT"], id, "ShowColoredText", nil, level);
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddHide
DESC: Menu - add a Hide (localized) command at the given level in the form of a button. When clicked this will remove the plugin from the Titan bar.
VAR: id - id of the plugin
VAR: level - level to put the line
OUT: None
--]]
function TitanPanelRightClickMenu_AddHide(id, level)
	local info = {};
	info.notCheckable = true;
	info.text = L["TITAN_PANEL_MENU_HIDE"];
	info.value = nil -- value; huh - what should this be?
	info.func = function()
		TitanPanelRightClickMenu_Hide(id)
	end
	UIDropDownMenu_AddButton(info, level);
end

--[[ API
NAME: TitanPanelRightClickMenu_ToggleVar
DESC: This will toggle the Titan variable and the update the button.
VAR: value - table of (id of the plugin, saved var to be updated, control table)
OUT:  None
--]]
function TitanPanelRightClickMenu_ToggleVar(value)
	local id, var, toggleTable = nil, nil, nil;

	-- table expected else do nothing
	if type(value)~="table" then return end

	if value and value[1] then id = value[1] end
	if value and value[2] then var = value[2] end
	if value and value[3] then toggleTable = value[3] end

	-- Toggle var
	TitanToggleVar(id, var);

	if ( TitanPanelRightClickMenu_AllVarNil(id, toggleTable) ) then
		-- Undo if all vars in toggle table nil
		TitanToggleVar(id, var);
	else
		-- Otherwise continue and update the button
		TitanPanelButton_UpdateButton(id, 1);
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AllVarNil
DESC: Check if all the variables in the table are nil/false.
VAR: id - id of the plugin
VAR: toggleTable - table of saved var to be checked
OUT: bool - true (1) or nil
--]]
function TitanPanelRightClickMenu_AllVarNil(id, toggleTable)
	if ( toggleTable ) and type(toggleTable)== "table" then
		for i, v in toggleTable do
			if ( TitanGetVar(id, v) ) then
				return nil;
			end
		end
		return 1;
	end
end

--[[ API
NAME: TitanPanelRightClickMenu_AddToggleColoredText
DESC: This will toggle the "ShowColoredText" Titan variable then update the button
VAR: id - id of the plugin
VAR: level - level to put the line
OUT:  None
--]]
function TitanPanelRightClickMenu_ToggleColoredText(value)
	TitanToggleVar(value, "ShowColoredText");
	TitanPanelButton_UpdateButton(value, 1);
end

--[[ API
NAME: TitanPanelRightClickMenu_SetCustomBackdrop
DESC: This will set the backdrop of the given button. This is used for custom created controls such as Clock offset or Volume sliders to give a consistent look.
VAR: frame - the control frame of the plugin
OUT:  None
--]]
function TitanPanelRightClickMenu_SetCustomBackdrop(frame)
	frame:SetBackdrop({
		bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true,
		tileEdge = true,
		insets = { left = 1, right = 1, top = 1, bottom = 1 },
		tileSize = 8,
		edgeSize = 8,
	})

	frame:SetBackdropBorderColor(
		TOOLTIP_DEFAULT_COLOR.r,
		TOOLTIP_DEFAULT_COLOR.g,
		TOOLTIP_DEFAULT_COLOR.b);
	frame:SetBackdropColor(
		TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
		TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,
		TOOLTIP_DEFAULT_BACKGROUND_COLOR.b
		, 1);
end

--[[ API
NAME: TitanPanelRightClickMenu_AddControlVars
DESC: Menu - add the set of options that are in the plugin registry control variables .
VAR: id - id of the plugin
OUT:  None
NOTE: Assume top level only
--]]
function TitanPanelRightClickMenu_AddControlVars(id, hide_text)
	local level = 1 -- assume top menu
    TitanPanelRightClickMenu_AddSeparator(level)
	
	TitanPanelRightClickMenu_AddToggleIcon(id, level)
	TitanPanelRightClickMenu_AddToggleLabelText(id, level)
	TitanPanelRightClickMenu_AddToggleColoredText(id, level)
	TitanPanelRightClickMenu_AddToggleRightSide(id, level)

	TitanPanelRightClickMenu_AddSpacer();
	TitanPanelRightClickMenu_AddCommand(L["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
end


--------------------------------------------------------------
--
-- Plugin manipulation routines
--
--[[ local
NAME: TitanUtils_SwapButtonOnBar
DESC: This will swap two buttons on the Titan bars. Once swapped then 'reinit' the buttons to show properly. This is currently used as part of the shift left / right.
VAR: from_id - id of the plugin
VAR: to_id - id of the plugin
OUT:  None
--]]
local function TitanUtils_SwapButtonOnBar(from_id, to_id)
	-- Used as part of the shift L / R to swap the buttons
	local button = TitanPanelSettings.Buttons[from_id]
	local locale = TitanPanelSettings.Location[from_id]

	TitanPanelSettings.Buttons[from_id] = TitanPanelSettings.Buttons[to_id]
	TitanPanelSettings.Location[from_id] = TitanPanelSettings.Location[to_id]
	TitanPanelSettings.Buttons[to_id] = button
	TitanPanelSettings.Location[to_id] = locale
	TitanPanel_InitPanelButtons();
end

--[[ local
NAME: TitanUtils_GetNextButtonOnBar
DESC: Find the next button that is on the same bar and is on the same side.
VAR: bar - The Titan bar to search
VAR: id - id of the plugin to see if there is a plugin next to it
VAR: side - right or left
OUT: int - index of the next button or nil if none found
NOTE:
-- buttons on Left are placed L to R; buttons on Right are placed R to L. Next and prev depend on which side we need to check.
:NOTE
--]]
local function TitanUtils_GetNextButtonOnBar(bar, id, side)
	-- find the next button that is on the same bar and is on the same side
	-- return nil if not found
	local index = TitanUtils_GetCurrentIndex(TitanPanelSettings.Buttons, id);

	for i, id in pairs(TitanPanelSettings.Buttons) do
		if TitanUtils_GetWhichBar(id) == bar
		and i > index
		and TitanPanel_GetPluginSide(id) == side
		and TitanUtils_IsPluginRegistered(id) then
			return i;
		end
	end
end

--[[ local
NAME: TitanUtils_GetPrevButtonOnBar
DESC: Find the previous button that is on the same bar and is on the same side.
VAR: bar - The Titan bar to search
VAR: id - id of the plugin to see if there is a plugin previous to it
VAR: side - right or left
OUT: int - index of the previous button or nil if none found
NOTE:
-- buttons on Left are placed L to R; buttons on Right are placed R to L. Next and prev depend on which side we need to check.
:NOTE
--]]
local function TitanUtils_GetPrevButtonOnBar(bar, id, side)
	-- find the prev button that is on the same bar and is on the same side
	-- return nil if not found
	local index = TitanUtils_GetCurrentIndex(TitanPanelSettings.Buttons, id);
	local prev_idx = nil

	for i, id in pairs(TitanPanelSettings.Buttons) do
		if TitanUtils_GetWhichBar(id) == bar
		and i < index
		and TitanPanel_GetPluginSide(id) == side
		and TitanUtils_IsPluginRegistered(id) then
			prev_idx = i; -- this might be the previous button
		end
		if i == index then
			return prev_idx;
		end
	end
end

--[[ Titan
NAME: TitanUtils_AddButtonOnBar
DESC: Add the given plugin to the given bar. Then reinit the plugins to show it properly.
VAR: bar - The Titan bar to add the plugin
VAR: id - id of the plugin to add
OUT:  None.
--]]
function TitanUtils_AddButtonOnBar(bar, id)
	local frame_str  = TitanVariables_GetFrameName(bar)
	-- Add the button to the requested bar, if shown
	if (not bar)
	or (not id)
	or (not TitanPanelSettings)
	or (not TitanBarDataVars[frame_str].show) 
	then
		return;
	end

	local i = TitanPanel_GetButtonNumber(id)
	-- The _GetButtonNumber returns +1 if not found so it is 'safe' to
	-- update / add to the Location
	TitanPanelSettings.Buttons[i] = (id or "?")
	TitanPanelSettings.Location[i] = (bar or "Bar")
	TitanPanel_InitPanelButtons();
end

--[[ Titan
NAME: TitanUtils_GetFirstButtonOnBar
DESC: Find the first button that is on the given bar and is on the given side.
VAR: bar - The Titan bar to search
VAR: side - right or left
OUT: int - index of the first button or nil if none found
NOTE:
-- buttons on Left are placed L to R; buttons on Right are placed R to L. Next and prev depend on which side we need to check.
-- buttons on Right are placed R to L
:NOTE
--]]
function TitanUtils_GetFirstButtonOnBar(bar, side)
	-- find the first button that is on the same bar and is on the same side
	-- return nil if not found
	local index = 0

	for i, id in pairs(TitanPanelSettings.Buttons) do
		if TitanUtils_GetWhichBar(id) == bar
		and i > index
		and TitanPanel_GetPluginSide(id) == side
		and TitanUtils_IsPluginRegistered(id) then
			return i;
		end
	end
end

--[[ Titan
NAME: TitanUtils_ShiftButtonOnBarLeft
DESC: Find the button that is on the bar and is on the side and left of the given button
VAR:
- name - id of the plugin
OUT:  None
--]]
function TitanUtils_ShiftButtonOnBarLeft(name)
	-- Find the button to the left. If there is one, swap it in the array
	local from_idx = TitanUtils_GetCurrentIndex(TitanPanelSettings.Buttons,name)
	local side = TitanPanel_GetPluginSide(name)
	local bar = TitanUtils_GetWhichBar(name)
	local to_idx = nil

	-- buttons on Left are placed L to R;
	-- buttons on Right are placed R to L
	if side and side == TITAN_LEFT then
		to_idx = TitanUtils_GetPrevButtonOnBar (TitanUtils_GetWhichBar(name), name, side)
	elseif side and side == TITAN_RIGHT then
		to_idx = TitanUtils_GetNextButtonOnBar (TitanUtils_GetWhichBar(name), name, side)
	end

	if to_idx then
		TitanUtils_SwapButtonOnBar(from_idx, to_idx);
	else
		return
	end
end

--[[ Titan
NAME: TitanUtils_ShiftButtonOnBarRight
DESC: Find the button that is on the bar and is on the side and right of the given button
VAR:
- name - id of the plugin
OUT:  None
--]]
function TitanUtils_ShiftButtonOnBarRight(name)
	-- Find the button to the right. If there is one, swap it in the array
	local from_idx = TitanUtils_GetCurrentIndex(TitanPanelSettings.Buttons,name)
	local to_idx = nil
	local side = TitanPanel_GetPluginSide(name)
	local bar = TitanUtils_GetWhichBar(name)

	-- buttons on Left are placed L to R;
	-- buttons on Right are placed R to L
	if side and side == TITAN_LEFT then
		to_idx = TitanUtils_GetNextButtonOnBar (bar, name, side)
	elseif side and side == TITAN_RIGHT then
		to_idx = TitanUtils_GetPrevButtonOnBar (bar, name, side)
	end

	if to_idx then
		TitanUtils_SwapButtonOnBar(from_idx, to_idx);
	else
		return
	end
end

--------------------------------------------------------------
--
-- Control Frame check & manipulation routines
--
--[[ Titan Plugins
NAME: TitanUtils_CheckFrameCounting
DESC: Check the frame - expected to be a control / menu frame. Close if timer has expired. Used in plugin OnUpdate
VAR:
- frame - control / menu frame
- elapsed - portion of second since last OnUpdate
OUT:  None
--]]
function TitanUtils_CheckFrameCounting(frame, elapsed)
	if (frame:IsVisible()) then
		if (not frame.frameTimer or not frame.isCounting) then
			return;
		elseif ( frame.frameTimer < 0 ) then
			frame:Hide();
			frame.frameTimer = nil;
			frame.isCounting = nil;
		else
			frame.frameTimer = frame.frameTimer - elapsed;
		end
	end
end

--[[ Titan Plugins
NAME: TitanUtils_StartFrameCounting
DESC: Set the max time the control frame could be open once cursor has left frame. Used in plugin OnLeave
VAR:
- frame - control / menu frame
- frameShowTime - max time
OUT:  None
--]]
function TitanUtils_StartFrameCounting(frame, frameShowTime)
	frame.frameTimer = frameShowTime;
	frame.isCounting = 1;
end

--[[ Titan Plugins
NAME: TitanUtils_StopFrameCounting
DESC: Remove timer flag once cursor has entered frame. Used in plugin OnEnter
VAR:
- frame - control / menu frame
OUT:  None
--]]
function TitanUtils_StopFrameCounting(frame)
	frame.isCounting = nil;
end

--[[ Titan Plugins AND Titan
NAME: TitanUtils_CloseAllControlFrames
DESC: Remove all timer flags on plugin control frames. Used for plugin Shift+Left and within Titan
VAR:  None
OUT:  None
--]]
function TitanUtils_CloseAllControlFrames()
	for index, value in pairs(TitanPlugins) do
		local frame = _G["TitanPanel"..index.."ControlFrame"];
		if (frame and frame:IsVisible()) then
			frame:Hide();
		end
	end
end

--[[ Titan Plugins AND Titan
NAME: TitanUtils_GetOffscreen
DESC: Check where the control frame should be on screen; return x and y
VAR:  None
OUT: float - x where frame should be
OUT: float - y where frame should be
--]]
function TitanUtils_GetOffscreen(frame)
	local offscreenX, offscreenY;
	local ui_scale = UIParent:GetEffectiveScale()
	if not frame then
		return
	end
	local fr_scale = frame:GetEffectiveScale()

	if ( frame and frame:GetLeft()
	and frame:GetLeft() * fr_scale < UIParent:GetLeft() * ui_scale ) then
		offscreenX = -1;
	elseif ( frame and frame:GetRight()
	and frame:GetRight() * fr_scale > UIParent:GetRight() * ui_scale ) then
		offscreenX = 1;
	else
		offscreenX = 0;
	end

	if ( frame and frame:GetTop()
	and frame:GetTop() * fr_scale > UIParent:GetTop() * ui_scale ) then
		offscreenY = -1;
	elseif ( frame and frame:GetBottom()
	and frame:GetBottom() * fr_scale < UIParent:GetBottom() * ui_scale ) then
		offscreenY = 1;
	else
		offscreenY = 0;
	end

	return offscreenX, offscreenY;
end

--------------------------------------------------------------
--
-- Plugin registration routines
--
--[[ Titan
NAME: TitanUtils_GetAddOnMetadata
DESC: Attempt to get meta data from the addon
VAR:
- name - string of addon name
- field - string of addon field to get
OUT:  None
NOTE:
- As of May 2023 (10.1) the routine moved and no longer dies silently so it is wrapped here...
--]]
function TitanUtils_GetAddOnMetadata(name, field)
	local call_success, ret_val

	-- Just in case, catch any errors
	call_success, -- needed for pcall
	ret_val =  -- actual return values
		pcall (C_AddOns.GetAddOnMetadata, name, field)
	if call_success then
		-- all is good 
		return ret_val
	else
		-- Some error.. for our use return nil
		return nil
	end
end

--[[ Titan
NAME: TitanUtils_PluginToRegister
DESC: Place the plugin to be registered later by Titan
VAR:
- self - frame of the plugin (must be a Titan template)
- isChildButton - true if the frame is a child of a Titan frame
OUT:  None
NOTE:
- .registry is part of 'self' (the Titan plugin frame) which works great for Titan specific plugins.
  Titan plugins create the registry as part of the frame _OnLoad.
  But this does not work for LDB buttons. The frame is created THEN the registry is added to the frame.
- Any read of the registry must assume it may not exist. Also assume the registry could be updated after this routine.
- This is called when a Titan plugin frame is created. Normally these are held until the player 'enters world' then the plugin is registered.
  Sometimes plugin frames are created after this process. Right now only LDB plugins are handled. If someone where to start creating Titan frames after the registration process were complete then it would fail to be registered...
-!For LDB plugins the 'registry' is attached to the frame AFTER the frame is created...
- The fields put into "Attempted" are defaulted here in preperation of being registered.
--]]
function TitanUtils_PluginToRegister(self, isChildButton)
	TitanPluginToBeRegisteredNum = TitanPluginToBeRegisteredNum + 1
	local cat = ""
	local notes = ""
	local name = ""
	if self and self.registry then
		cat = (self.registry.category or "")
		notes = (self.registry.notes or "")
		name = (self.registry.id or "")
	end
	-- Some of the fields in this record are displayed in the "Attempts"
	-- so they are defaulted here.
	TitanPluginToBeRegistered[TitanPluginToBeRegisteredNum] = {
		self = self,
		button = ((self and self:GetName()
			or "Nyl".."_"..TitanPluginToBeRegisteredNum)),
		isChild = (isChildButton and true or false),
		-- fields below are updated when registered
		name = "?",
		issue = "",
		status = TITAN_NOT_REGISTERED,
		category = cat,
		plugin_type = "",
		notes = notes,
	}

	--[[ For updated menu lib (Dec 2018)
	Old way was to use the XML file to declare the frame, now it needs to be in Lua
	--]]
	local f = CreateFrame("Frame", 
		self:GetName()..TITAN_PANEL_CLICK_MENU_SUFFIX, 
		self or nil, 
		"UIDropDownMenuTemplate")

	-- Debug
	if Titan_Panel.debug.plugin_register then
		TitanDebug("Queue Plugin"
--			.." '"..tostring(self:GetName()).."'"
			.." '"..tostring(TitanUtils_GetButtonID(self:GetName())).."'"
			.." "..tostring(TITAN_NOT_REGISTERED)..""
			)
	end
end

--[[ Titan
NAME: TitanUtils_PluginFail
DESC: Place the plugin to be registered later by Titan
VAR:
- plugin - frame of the plugin (must be a Titan template)
OUT:  None
NOTE:
- This is called when a plugin is unsupported. Cuurently this is used if a LDB data object is not supported. See SupportedDOTypes in LDBToTitan.lua for more detail.
  It is intended mainly for developers. It is a place to put relevant info for debug and so users can supply troubleshooting info.
  The key is set the status to 'fail' so there is no further attempt to register the plugin.
- The results will show in "Attempted" so the developer has a shot at figuring out what was wrong.
- plugin is expected to hold as much relevant info as possible...
--]]
function TitanUtils_PluginFail(plugin)
	TitanPluginToBeRegisteredNum = TitanPluginToBeRegisteredNum + 1
	TitanPluginToBeRegistered[TitanPluginToBeRegisteredNum] =
		{
		self = plugin.self,
		button = (plugin.button and plugin.button:GetName() or ""),
		isChild = (plugin.isChild and true or false),
		name = (plugin.name or "?"),
		issue = (plugin.issue or "?"),
		status = (plugin.status or "?"),
		category = (plugin.category or ""),
		plugin_type = (plugin.plugin_type or ""),
		}

	local message = ""
		.." '"..tostring(TitanPluginToBeRegistered[TitanPluginToBeRegisteredNum].status).."'"
		.." '"..tostring(TitanPluginToBeRegistered[TitanPluginToBeRegisteredNum].name).."'"
		.." '"..tostring(TitanPluginToBeRegistered[TitanPluginToBeRegisteredNum].category).."'"
		.." '"..tostring(TitanPluginToBeRegistered[TitanPluginToBeRegisteredNum].issue).."'"
	TitanPrint(message, "error")
end

local function NoColor(name)
	local no_color = name
	
	-- Remove any color formatting from the name in the list
	no_color = string.gsub(no_color, "|c........", "")
	no_color = string.gsub(no_color, "|r", "")
	
	return no_color
end

local function AddCustomPluginVars(reg)
	-- These are added to EACH plugin for various Titan controlled features
	
	--==================
	-- Custom labels
	reg.savedVariables.CustomLabelTextShow = false
	reg.savedVariables.CustomLabelText = ""
	reg.savedVariables.CustomLabel2TextShow = false
	reg.savedVariables.CustomLabel2Text = ""
	reg.savedVariables.CustomLabel3TextShow = false
	reg.savedVariables.CustomLabel3Text = ""
	reg.savedVariables.CustomLabel4TextShow = false
	reg.savedVariables.CustomLabel4Text = ""
	-- Number of labels seen - make config less confusing
	reg.savedVariables.NumLabelsSeen = 1 -- assume at least one label
end

--[[ local
NAME: TitanUtils_RegisterPluginProtected
DESC: This routine is intended to be called in a protected manner (pcall) by Titan when it attempts to register a plugin.
VAR:
- plugin - frame of the plugin (must be a Titan template)
OUT:
- table
	.issue	: Show the user what prevented the plugin from registering
	.result	: Used so we know which plugins were processed
	.id		: The name used to lookup the plugin
	.cat		: The 'bucket' to use off the main Titan menu
	.ptype	: For now just Titan or LDB type
NOTE:
- We try to anticipate the various ways a plugin could fail to register or just plain fail.
  The intent is to keep Titan whole so a plugin does not prevent Titan from loading.
  And attempt to tell the user / developer what went wrong.
- If successful the plugin will be in TitanPlugins as a registered plugin and will be available for display on the Titan bars.
--]]
local function TitanUtils_RegisterPluginProtected(plugin)
	local result = ""
	local issue = ""
	local id = ""
	local cat = ""
	local ptype = ""
	local notes = ""
	local str = ""

	local self = plugin.self
	local isChildButton = (plugin.isChild and true or false)

	if self and self:GetName() then
		if (isChildButton) then
			-- This is a button within a button
			self:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp");
			self:RegisterForDrag("LeftButton")
			TitanPanelDetectPluginMethod(self:GetName(), true);
			result = TITAN_REGISTERED
			-- give some indication that this is valid...
			id = (self:GetName() or "").."<child>"
		else
			-- Check for the .registry where all the Titan plugin info is expected
			if (self.registry and self.registry.id) then
				id = self.registry.id
				if TitanUtils_IsPluginRegistered(id) then
					-- We have already registered this plugin!
					issue =  "Plugin '"..tostring(id).."' already loaded. "
					.."Please see if another plugin (Titan or LDB) is also loading "
					.."with the same name.\n"
					.."<Titan>.registry.id or <LDB>.label"
				else
					-- A sanity check just in case it was already in the list
					if TitanUtils_TableContainsValue(TitanPluginsIndex, id) then
						str = "In List ??"
					else
						str = "Save .registry"
						-- Herein lies any special per plugin variables Titan wishes to control
						-- These will be overwritten from saved vars, if any
						--
						-- Sanity check
						if self.registry.savedVariables then
							-- Custom labels
							self.registry.savedVariables.CustomLabelTextShow = false
							self.registry.savedVariables.CustomLabelText = ""
							self.registry.savedVariables.CustomLabel2TextShow = false
							self.registry.savedVariables.CustomLabel2Text = ""
							self.registry.savedVariables.CustomLabel3TextShow = false
							self.registry.savedVariables.CustomLabel3Text = ""
							self.registry.savedVariables.CustomLabel4TextShow = false
							self.registry.savedVariables.CustomLabel4Text = ""
						end

						-- Assign and Sort the list of plugins
						TitanPlugins[id] = self.registry;
						-- Set the name used for menus
						if TitanPlugins[id].menuText == nil then
							TitanPlugins[id].menuText = TitanPlugins[id].id;
						end
						TitanPlugins[id].menuText = NoColor(TitanPlugins[id].menuText)
						
						table.insert(TitanPluginsIndex, self.registry.id);
						table.sort(TitanPluginsIndex,
							function(a, b)
								return string.lower(TitanPlugins[a].menuText)
									< string.lower(TitanPlugins[b].menuText);
							end
						);
					end
				end
				if issue ~= "" then
					result = TITAN_REGISTER_FAILED
				else
					-- We are almost done-
					-- Allow mouse clicks on the plugin
					local pluginID = TitanUtils_GetButtonID(self:GetName());
					local plugin_id = TitanUtils_GetPlugin(pluginID);
					if (plugin_id) then
						self:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp");
						self:RegisterForDrag("LeftButton")
						if (plugin_id.id) then
							TitanPanelDetectPluginMethod(plugin_id.id);
						end
					end
					result = TITAN_REGISTERED
					-- determine the plugin category
					cat = (self.registry.category or nil)
					ptype = TITAN_ID -- Assume it is created for Titan
					if self.registry.ldb then
						-- Override the type with the LDB type
						ptype = "LDB: '"..self.registry.ldb.."'"
					end
				end
				notes = (self.registry.notes or "")

			else
				-- There could be a couple reasons the .registry was not found
				result = TITAN_REGISTER_FAILED
				if (not self.registry) then
					issue = "Can not find registry for plugin (self.registry)"
				end
				if (self.registry and not self.registry.id) then
					issue = "Can not determine plugin name (self.registry.id)"
				end
			end
		end
	else
		-- The button could not be determined - the plugin is hopeless
		result = TITAN_REGISTER_FAILED
		issue = "Can not determine plugin button name"
	end

	-- Debug
	if Titan_Panel.debug.plugin_register then
		TitanDebug("Plugin RegProt"
--			.." '"..tostring(self:GetName()).."'"
			.." '"..tostring(id).."'"
			.." '"..tostring(result).."'"
			.." '"..tostring(str).."'"
			.." '"..tostring(TitanPlugins[id].id).."'"
			)
	end
	-- create and return the results
	local ret_val = {}
	ret_val.issue = (issue or "")
	ret_val.result = (result or TITAN_REGISTER_FAILED)
	ret_val.id = (id or "")
	ret_val.cat = (cat or "General")
	ret_val.ptype = ptype
	ret_val.notes = notes
	return ret_val
end

--[[ Titan
NAME: TitanUtils_RegisterPlugin
DESC: Attempt to register a plugin that has requested to be registered
VAR:
- plugin - frame of the plugin (must be a Titan template)
OUT:  None
NOTE:
- Lets be extremely paranoid here because registering plugins that do not play nice can cause real headaches...
--]]
function TitanUtils_RegisterPlugin(plugin)
	local call_success, ret_val
	-- Ensure we have a glimmer of a plugin and that the plugin has not
	-- already been registered.
	if plugin and plugin.status == TITAN_NOT_REGISTERED then
		-- See if the request to register has a shot at success
		if plugin.self then
			-- Just in case, catch any errors
			call_success, -- needed for pcall
			ret_val =  -- actual return values
				pcall (TitanUtils_RegisterPluginProtected, plugin)
			-- pcall does not allow errors to propagate out. Any error
			-- is returned as text with the success / fail.
			-- Think of it as a try - catch block
			if call_success then
				-- all is good so write the return values to the plugin
				plugin.status = ret_val.result
				plugin.issue = ret_val.issue
				plugin.name = ret_val.id
				plugin.category = ret_val.cat
				plugin.notes = ret_val.notes
				plugin.plugin_type = ret_val.ptype
			else
				-- write enough to the plugin so the user or developer
				-- can see Titan at least tried...
				plugin.status = TITAN_REGISTER_FAILED
				plugin.issue = (ret_val.issue or "Unknown error")
				plugin.name = "?"
				plugin.notes = ret_val.notes or ""
			end
		else
			-- write enough to the plugin so the user or developer can see something
			plugin.status = TITAN_REGISTER_FAILED
			plugin.issue = "Can not determine plugin button name"
			plugin.name = "?"
		end

		-- If there was an error tell the user.
		if not plugin.issue == ""
		or plugin.status ~= TITAN_REGISTERED then
			TitanPrint(TitanUtils_GetRedText("Error Registering Plugin")
				..TitanUtils_GetGreenText(
					": "
					.."name: '"..(plugin.name or "?_").."' "
					.."issue: '"..(plugin.issue or "?_").."' "
					.."button: '"..plugin.button.."' "
					)
				)
		end

		-- Debug
		if Titan_Panel.debug.plugin_register then
			local status = plugin.status
			if plugin.status == TITAN_REGISTER_FAILED then
				status = TitanUtils_GetRedText(status)
			else
				status = TitanUtils_GetGreenText(status)
			end
			TitanDebug("Registering Plugin"
				.." "..tostring(plugin.name)..""
				.." "..tostring(status)..""
				)
		end
	end
end

--[[ Titan
NAME: TitanUtils_RegisterPluginList
DESC: Attempt to register the list of plugins that have requested to be registered
VAR:  None
OUT:  None
NOTE:
- Tell the user when this starts and ends only on the first time.
  This could be called if a plugin requests to be registered after the first loop through.
--]]
function TitanUtils_RegisterPluginList()
	-- Loop through the plugins that have requested to be loaded into Titan.
	local result = ""
	local issue = ""
	local id
	local cnt = 0
	if TitanPluginToBeRegisteredNum > 0 then
		if not Titan__InitializedPEW and TitanAllGetVar("Registered") then
			TitanDebug(L["TITAN_PANEL_REGISTER_START"], "normal")
		end
		for index, value in ipairs(TitanPluginToBeRegistered) do
			if TitanPluginToBeRegistered[index] then
				TitanUtils_RegisterPlugin(TitanPluginToBeRegistered[index])
			end
			cnt = cnt + 1
		end
		if not Titan__InitializedPEW and TitanAllGetVar("Registered") then
			TitanDebug((L["TITAN_PANEL_REGISTER_END"].." "..cnt), "normal")
		end
	end
end

--[[ API
NAME: TitanUtils_IsPluginRegistered
DESC: See if the given plugin was registered successfully.
VAR:
- id - id of the plugin
OUT:  None
- true (successful) or false
--]]
function TitanUtils_IsPluginRegistered(id)
	if (id and TitanPlugins[id]) then
		return true;
	else
		return false;
	end
end

--------------------------------------------------------------
-- Right click menu routines for Titan Panel bars

--[[ Titan
NAME: TitanUtils_CloseRightClickMenu
DESC: Close the right click menu of any plugin if it was open. Only one can be open at a time.
VAR:  None
OUT:  None
--]]
function TitanUtils_CloseRightClickMenu()
	if (_G["DropDownList1"]:IsVisible()) then
		_G["DropDownList1"]:Hide();
	end
end

--[[ local
NAME: TitanRightClickMenu_OnLoad
DESC: Prepare the plugin right click menu using the function given by the plugin =or Titan bar.
VAR:
- plugin - frame of the plugin (must be a Titan template)
OUT:  None
NOTE:
- The function to be called is assumed to be "TitanPanelRightClickMenu_Prepare"..plugin_id.."Menu".
- This routine handles Titan plugins and the Titan bars.
- TitanUtils_GetButtonIDFromMenu returns a generic "Bar" when the user clicks on a Titan bar. 
  This works because every Titan bar uses the same menu; allows one routine to be reused.
--]]
local function TitanRightClickMenu_OnLoad(self)
	local id = TitanUtils_GetButtonIDFromMenu(self);
	if id then
		local prepareFunction = _G["TitanPanelRightClickMenu_Prepare"..id.."Menu"]
		if prepareFunction and type(prepareFunction) == "function" then
			UIDropDownMenu_Initialize(self, prepareFunction, "MENU");
		end
	else
		if Titan_Panel.debug.tool_tips then
			TitanDebug("Could not display tooltip. "
			.."Could not determine Titan ID for "
			.."'"..(self:GetName() or "?").."'. "
			,"error")
		end
	end
	
	-- Under the cover the menu is built as DropDownList1
	return DropDownList1, DropDownList1:GetHeight(), DropDownList1:GetWidth()
end

--[[ Titan
NAME: TitanPanelRightClickMenu_Toggle
DESC: Call the routine to build the plugin menu then place it properly.
VAR:
- self - frame of the plugin (must be a Titan template)
- isChildButton - function to create the menu
OUT:  None
NOTE:
- This routine is for Titan plugins. There is a similar routine for the Titan bar.
--]]
function TitanPanelRightClickMenu_Toggle(self)
	-- Mar 2023 : Rewritten to place menu relative to the passed in frame (button)
	-- There are two places for the menu creation routine
	-- 1) Titan bar - creates same menu
	-- 2) Plugin creation via the .registry
	local frame = self:GetName() 
	local menu = _G[self:GetName()..TITAN_PANEL_CLICK_MENU_SUFFIX]
--[[
print("_ toggle R menu"
.." "..tostring(frame)..""
)
--]]
	-- Create menu based on the frame's routine for right click menu
	local drop_menu, menu_height, menu_width = TitanRightClickMenu_OnLoad(menu)

	-- Adjust the Y offset as needed
	local rel_y = _G[frame]:GetTop() - menu_height
	if rel_y > 0 then 
		menu.point = "TOP";
		menu.relativePoint = "BOTTOM";
	else
		-- too close to bottom of screen
		menu.point = "BOTTOM";
		menu.relativePoint = "TOP";
	end

	-- Adjust the X offset as needed
	local x_offset = 0
	local left = 0
	if TitanBarData[frame] then
		-- on a Titan bar so use cursor for the 'left'
		left = GetCursorPosition() -- get x; ignore y
		left = left / UIParent:GetEffectiveScale()
		-- correct for beginning of Titan bar
		left = left - _G[frame]:GetLeft()
	else
		-- a plugin
		left = _G[frame]:GetLeft()
	end
	local rel_x = left + menu_width
	if ( rel_x < GetScreenWidth() ) then
		-- menu will fit
		menu.point = menu.point.."LEFT";
		menu.relativePoint = menu.relativePoint.."LEFT";

		if TitanBarData[frame] then
			x_offset = left
		else
			-- a plugin
			x_offset = 0
		end
	else
		-- Menu would go off right side of the screen 
		menu.point = menu.point.."RIGHT";
		menu.relativePoint = menu.relativePoint.."RIGHT";
		
		if TitanBarData[frame] then
			-- correct is on Titan bar (bottom, far right)
			-- flip calc since we flipped the anchor to right
			x_offset = GetScreenWidth() - left
		else
			-- a plugin
			x_offset = 0
		end
	end
--[[
print("RCM"
.." "..tostring(frame)..""
.." "..tostring(format("%0.1f", menu_height))..""
.." "..tostring(format("%0.1f", menu_width))..""
.." "..tostring(format("%0.1f", _G[frame]:GetLeft()))..""
.." "..tostring(menu.point)..""
.." "..tostring(menu.relativePoint)..""
.." "..tostring(format("%0.1f", left))..""
)
--]]
	ToggleDropDownMenu(1, nil, menu, frame, x_offset, 0, nil, self);
end

--[[ Titan
NAME: TitanPanelRightClickMenu_IsVisible
DESC: Determine if a right click menu is shown. There can only be one.
VAR:  None
OUT:
- true (IsVisible) or false
--]]
function TitanPanelRightClickMenu_IsVisible()
	local res = false
	if _G[drop_down_1] and _G[drop_down_1]:IsVisible() then
		res = true
	else
		res = false
	end
	return res
end

--[[ Titan
NAME: TitanPanelRightClickMenu_Close
DESC: Close the right click menu if shown. There can only be one.
VAR:  None
OUT:  None
--]]
function TitanPanelRightClickMenu_Close()
	if _G[drop_down_1] and _G[drop_down_1]:IsVisible() then
		_G[drop_down_1]:Hide()
	end
end

--------------------------------------------------------------
-- Titan utility routines

--[[ Titan
NAME: TitanUtils_ParseName
DESC: Parse the player name and return the parts.
VAR:
- name - the name to break up
OUT:
- string player name only
- string realm name only
--]]
function TitanUtils_ParseName(name)
	local server = ""
	local player = ""
	if name and name ~= TITAN_PROFILE_NONE then
		local s, e, ident = string.find(name, TITAN_AT);
		if s ~= nil then
			server = string.sub(name, s+1);
			player = string.sub(name, 1, s-1);
		end
	else
	end
	return player, server
end

--[[ Titan
NAME: TitanUtils_CreateName
DESC: Given the player name and server and return the Titan name.
VAR:
- player - 1st part
- realm - 2nd part. Could be realm or 'custom'
OUT:
- string - Titan name
--]]
function TitanUtils_CreateName(player, realm)
	local p1 = player or "?"
	local p2 = realm or "?"

	return p1..TITAN_AT..p2
end

--[[ Titan
NAME: TitanUtils_GetPlayer
DESC: Create the player name (toon being played) and return the parts.
VAR:  None
OUT:
- string Titan player name or nil
- string player name only
- string realm name only
--]]
function TitanUtils_GetPlayer()
	local playerName = UnitName("player");
	local serverName = GetRealmName();
	local toon = nil

	if (playerName == nil
	or serverName == nil
	or playerName == UKNOWNBEING) then
		-- Do nothing if player name is not available
	else
		toon = playerName..TITAN_AT..serverName
	end

	return toon, playerName, serverName
end

--[[ Titan
NAME: TitanUtils_GetGlobalProfile
DESC: Return the global profile setting and the global profile name, if any.
VAR:  None
OUT:
- bool Global profile value
- string Global profile name or default
- string player name only or blank
- string realm name only or blank
--]]
function TitanUtils_GetGlobalProfile()
	local playerName = ""
	local serverName = ""
	local glob = TitanAllGetVar("GlobalProfileUse")
	local toon = TitanAllGetVar("GlobalProfileName")

	if not toon then
		-- this is a new install or toon
		toon = TITAN_PROFILE_NONE
		TitanAllSetVar("GlobalProfileName", TITAN_PROFILE_NONE)
	end
	if (toon == TITAN_PROFILE_NONE) then
		--
	else
		-- If the profile name is not the default then split the name
		playerName, serverName = TitanUtils_ParseName(toon)
	end

	return glob, toon, playerName, serverName
end

--[[ Titan
NAME: TitanUtils_SetGlobalProfile
DESC: Return the global profile setting and the global profile name, if any.
VAR:
- bool Global profile value
- string Global profile name or default
OUT:  None
--]]
function TitanUtils_SetGlobalProfile(glob, toon)
	TitanAllSetVar("GlobalProfileUse", glob)
	if glob then
		-- The user asked for global
		if toon == nil or toon == TITAN_PROFILE_NONE then
			-- nothing was set before so use current player
			toon = TitanUtils_GetPlayer()
		end
	end
	TitanAllSetVar("GlobalProfileName", toon or TITAN_PROFILE_NONE)
end

--[[ Titan
NAME: TitanUtils_ScreenSize
DESC: Return the screen size after scaling
VAR:
- output - boolean if true dump a lot of UI size info to chat
OUT:
- number - scaled X / width
- number - scaled Y / height
--]]
function TitanUtils_ScreenSize(output)
	local screen = {}
	screen.x = UIParent:GetRight() 
	screen.y = UIParent:GetTop() 
	screen.scaled_x = UIParent:GetRight() * UIParent:GetEffectiveScale()
	screen.scaled_y = UIParent:GetTop() * UIParent:GetEffectiveScale()
	
	if output then
		local x = UIParent:GetRight()
		local y = UIParent:GetTop()
		local s = UIParent:GetEffectiveScale()
		local px, py = GetPhysicalScreenSize()
		print("_ScreenSize"
		.."\n"
		.." UI - x:"..tostring(format("%0.1f", x))..""
		.." X y:"..tostring(format("%0.1f", y))..""
		.."\n"
		.." UI scaled - x:"..tostring(format("%0.1f", screen_x * UIParent:GetEffectiveScale()))..""
		.." X y:"..tostring(format("%0.1f", screen_y * UIParent:GetEffectiveScale()))..""
		.."\n"
		.." Scale: UI"..tostring(format("%0.6f", s))..""
		.." Titan "..tostring(format("%0.1f", TitanPanelGetVar("Scale")))..""
		.."\n"
		.." screen - x:"..tostring(format("%0.1f", px))..""
		.." X y:"..tostring(format("%0.1f", py))..""
		)
	end
	
	return screen
end


--------------------------------------------------------------
-- Various debug routines
--[[
local function Debug_array(message)
local idx = TitanDebugArray.index
	TitanDebugArray.index = mod(TitanDebugArray.index + 1, TITAN_DEBUG_ARRAY_MAX)
	TitanDebugArray.lines[TitanDebugArray.index] = (date("%m/%d/%y %H:%M:%S".." : ")..message)
end
--]]
--[[ Titan
NAME: TitanPanel_GetVersion
DESC: Get the Titan version into a string.
VAR:  None
OUT:
- string containing the version
--]]
function TitanPanel_GetVersion()
	return tostring(TitanUtils_GetAddOnMetadata(TITAN_ID, "Version")) or L["TITAN_NA"];
end
--[[ Titan
NAME: TitanPrint
DESC: Output a message to the user in a consistent format.
VAR:
- message - string to output
- msg_type - "info" | "warning" | "error" | "plain"
OUT:
- string - message to chat window
--]]
function TitanPrint(message, msg_type)
	local dtype = ""
	local pre = TitanUtils_GetGoldText(L["TITAN_PRINT"]..": ")
	local msg = ""
	if msg_type == "error" then
		dtype = TitanUtils_GetRedText("Error: ")
	elseif msg_type == "warning" then
		dtype = "|cFFFFFF00".."Warning: ".._G["FONT_COLOR_CODE_CLOSE"]
	elseif msg_type == "plain" then
		pre = ""
	elseif msg_type == "header" then
		local ver = TitanPanel_GetVersion()
		pre = TitanUtils_GetGoldText(L["TITAN_PANEL"])
			..TitanUtils_GetGreenText(" "..ver)
			..TitanUtils_GetGoldText(L["TITAN_PANEL_VERSION_INFO"]
			)
	end

	msg = pre..dtype..TitanUtils_GetGreenText(message)
	DEFAULT_CHAT_FRAME:AddMessage(msg)
--	Debug_array(msg)
end

function TitanDebug(debug_message, debug_type)
	local dtype = ""
	local time_stamp = ""
	local msg = ""
	if debug_type == "error" then
		dtype = TitanUtils_GetRedText("Error: ")
	elseif debug_type == "warning" then
		dtype = TitanUtils_GetHighlightText("Warning: ")
	end
	if debug_type == "normal" then
		time_stamp = ""
	else
		time_stamp = TitanUtils_GetGoldText(date("%H:%M:%S")..": ")
	end
	if debug_message == true then
		debug_message = "<true>";
	end
	if debug_message == false then
		debug_message = "<false>";
	end
	if debug_message == nil then
		debug_message = "<nil>";
	end

	msg =
		TitanUtils_GetGoldText(L["TITAN_DEBUG"].." ")
		..time_stamp
		..dtype
--		..TitanUtils_GetBlueText(debug_message)
		..TitanUtils_GetHexText(debug_message, "1DA6C5")

	if not TitanAllGetVar("Silenced") then
		_G["DEFAULT_CHAT_FRAME"]:AddMessage(msg)
	end
--	Debug_array(msg)
	--date("%m/%d/%y %H:%M:%S")
end

function TitanDumpPluginList()
	-- Just dump the current list of plugins
	local plug_in = {}
	for idx, value in pairs(TitanPluginsIndex) do
		plug_in = TitanUtils_GetPlugin(TitanPluginsIndex[idx])
		if plug_in then
			TitanDebug("TitanDumpPluginList "
				.."'"..idx.."'"
				..": '"..(plug_in.id or "?").."'"
				..": '"..(plug_in.version or "?").."'"
			)
		end
	end
end

function TitanDumpPlayerList()
	-- Just dump the current list of toons in Titan config
	local cnt = 0
	TitanDebug("TitanDumpPlayerList ==== start")
	if TitanSettings.Players then
		for idx, value in pairs(TitanSettings.Players) do
			TitanDebug("-- "
				.."'"..(idx or "?").."'"
			)
			cnt = cnt + 1
		end
	else
		TitanDebug("No player list found!!! "
			)
	end
	TitanDebug("TitanDumpPlayerList ==== done "..cnt)
end

function TitanDumpFrameName(self)
	local frame
	local parent
	if self then
		frame = self:GetName()
	else
		frame = "?"
	end
	if frame == "?" then
		parent = "?"
	else
		parent = self:GetParent():GetName()
	end
--[
TitanDebug("_GetFrameName "
..(self and "T" or "F").." "
..(frame or "?").." "
..(parent or "?").." "
)
--]]
end

function TitanDumpTimers()
	local str = "Titan-timers: "
		.."'"..(TitanAllGetVar("TimerLDB") or "?").."' "
	TitanPrint(str, "plain")
end

function TitanArgConvert (event, a1, a2, a3, a4, a4, a5, a6)
	local t1 = type(a1)
	local t2 = type(a2)
	local t3 = type(a3)
	local t4 = type(a4)
	local t5 = type(a5)
	local t6 = type(a6)
	if type(a1) == "boolean" then a1 = (a1 and "T" or "F") end
	if type(a2) == "boolean" then a2 = (a2 and "T" or "F") end
	if type(a3) == "boolean" then a3 = (a3 and "T" or "F") end
	if type(a4) == "boolean" then a4 = (a4 and "T" or "F") end
	if type(a5) == "boolean" then a5 = (a5 and "T" or "F") end
	if type(a6) == "boolean" then a6 = (a6 and "T" or "F") end
	TitanDebug(event.." "
		.."1: "..(a1 or "?").."("..t1..") "
		.."2: "..(a2 or "?").."("..t2..") "
		.."3: "..(a3 or "?").."("..t3..") "
		.."4: "..(a4 or "?").."("..t4..") "
		.."5: "..(a5 or "?").."("..t5..") "
		.."6: "..(a6 or "?").."("..t6..") "
	)
end

function TitanDumpTable(tb, level)
  level = level or 1
  local spaces = string.rep(' ', level*2)
  for k,v in pairs(tb) do
    if type(v) ~= "table" then
      print("["..level.."]v'"..spaces.."["..tostring(k).."]='"..tostring(v).."'")
    else
      print("["..level.."]t'"..spaces.."["..tostring(k).."]")
     level = level + 1
	 if level <= 8 then
     TitanDumpTable(v, level)
	 end
    end
  end  
end


--------------------------------------------------------------
--
-- Deprecated routines
-- These routines will be commented out for a couple releases then deleted.
--
--[===[
--[[ API
NAME: TitanUtils_GetMinimapAdjust
DESC: Return the current setting of the Titan MinimapAdjust option.
VAR: None
OUT: The value of the MinimapAdjust option
NOTE:
-  As of DragonFlight Titan Loc no longer adjusts or manipulates the minimap.
--]]
function TitanUtils_GetMinimapAdjust() -- Used by addons
--	return not TitanPanelGetVar("MinimapAdjust")
	return false
end

--[[ API
NAME: TitanUtils_SetMinimapAdjust
DESC: Set the current setting of the Titan MinimapAdjust option.
VAR:  bool - true (off) or false (on)
OUT:  None
NOTE:
-  As of DragonFlight Titan Loc no longer adjusts or manipulates the minimap.
--]]
function TitanUtils_SetMinimapAdjust(bool) -- Used by addons
	-- This routine allows an addon to turn on or off
	-- the Titan minimap adjust.
--	TitanPanelSetVar("MinimapAdjust", not bool)
end

--[[ API
NAME: TitanUtils_AddonAdjust
DESC: Tell Titan to adjust (or not) a frame.
VAR: frame - is the name (string) of the frame
VAR: bool  - true if the addon will adjust the frame or false if Titan will adjust
OUT:  None
Note:
-- As of DragonFlight, this is no longer needed. The Titan user can user place - or not - a couple frames not user placeable,

- Titan will NOT store the adjust value across a log out / exit.
- This is a generic way for an addon to tell Titan to not adjust a frame. The addon will take responsibility for adjusting that frame. This is useful for UI style addons so the user can run Titan and a modifed UI.
- The list of frames Titan adjusts is specified in TitanMovableData within TitanMovable.lua.
- If the frame name is not in TitanMovableData then Titan does not adjust that frame.
:NOTE
--]]
function TitanUtils_AddonAdjust(frame, bool) -- Used by addons
--	TitanMovable_AddonAdjust(frame, bool)
end

function TitanUtils_IsAnyControlFrameVisible() -- need?
	for index, value in TitanPlugins do
		local frame = _G["TitanPanel"..index.."ControlFrame"];
		if (frame:IsVisible()) then
			return true;
		end
	end
	return false;
end

--]===]
