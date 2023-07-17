--[[ File
NAME: TitanPanelTemplate.lua
DESC: Contains the routines to handle a frame created as a Titan plugin.
--]]
--[[ API
NAME: TitanPanelTemplate overview
DESC: See TitanPanelButtonTemplate.xml also.

A Titan plugin is a frame created using one of the button types in TitanPanelButtonTemplate.xml which inherits TitanPanelButtonTemplate.
The available plugin types are:
TitanPanelTextTemplate - A frame that only displays text ("$parentText")
TitanPanelIconTemplate - A frame that only displays an icon ("$parentIcon")
TitanPanelComboTemplate - A frame that displays an icon then text ("$parentIcon"  "$parentText")

Most plugins use the combo template.

TitanPanelButtonTemplate.xml contains other templates available to be used.
TitanOptionsSliderTemplate - A frame that contains the basics of a slider control. See TitanVolume for an example.
TitanPanelChildButtonTemplate - A frame that allows a plugin within a plugin. The older version of TitanGold was an example. This may not be used anymore.

Each template contains:
- a frame to handle a menu invoked by a right mouse click ("$parentRightClickMenu")
- default event handlers for
			<OnLoad>
				TitanPanelButton_OnLoad(self);
			</OnLoad>
			<OnShow>
				TitanPanelButton_OnShow(self);
			</OnShow>
			<OnClick>
				TitanPanelButton_OnClick(self, button);
			</OnClick>
			<OnEnter>
				TitanPanelButton_OnEnter(self);
			</OnEnter>
			<OnLeave>
				TitanPanelButton_OnLeave(self);
			</OnLeave>
If these events are overridden then the default routine needs to be included!
:DESC
--]]

-- Globals

-- Constants
local TITAN_PANEL_LABEL_SEPARATOR = "  "
local TITAN_PANEL_BUTTON_WIDTH_CHANGE_TOLERANCE = 10;
local TITAN_PANEL_BUTTON_TYPE_TEXT = 1;
local TITAN_PANEL_BUTTON_TYPE_ICON = 2;
local TITAN_PANEL_BUTTON_TYPE_COMBO = 3;
local TITAN_PANEL_BUTTON_TYPE_CUSTOM = 4;
local pluginOnEnter = nil;
local TITAN_PANEL_MOVE_ADDON = nil;
local TITAN_PANEL_DROPOFF_ADDON = nil;

-- Library instances
local LibQTip = nil
local _G = getfenv(0);
local InCombatLockdown	= _G.InCombatLockdown;
local media = LibStub("LibSharedMedia-3.0")

--==========================

--[[ local
NAME: TitanPanel_SetScale
DESC: Set the scale of each plugin and each Titan bar.
VAR:  None
OUT:  None
--]]
function TitanPanel_SetScale()
	local scale = TitanPanelGetVar("Scale");

	-- Set all the Titan bars
	for idx,v in pairs (TitanBarData) do
		_G[idx]:SetScale(scale)
	end
	-- Set all the registered plugins
	for index, value in pairs(TitanPlugins) do
		if index then
			TitanUtils_GetButton(index):SetScale(scale);
		end
	end
end

--[[ local
NAME: TitanTooltip_AddTooltipText
DESC: Helper to add a line of tooltip text to the tooltip.
VAR:  text - string
OUT:  None
NOTE:
- Append a "\n" to the end if there is not one already there
:NOTE
--]]
local function TitanTooltip_AddTooltipText(text)
	if ( text ) then
		-- Append a "\n" to the end
		if ( string.sub(text, -1, -1) ~= "\n" ) then
			text = text.."\n";
		end

		-- See if the string is intended for a double column
		for text1, text2 in string.gmatch(text, "([^\t\n]*)\t?([^\t\n]*)\n") do
			if ( text2 ~= "" ) then
				-- Add as double wide
				GameTooltip:AddDoubleLine(text1, text2);
			elseif ( text1 ~= "" ) then
				-- Add single column line
				GameTooltip:AddLine(text1);
			else
				-- Assume a blank line
				GameTooltip:AddLine("\n");
			end
		end
	end
end

--[[ local
NAME: TitanTooltip_SetOwnerPosition
DESC: Set both the parent and the position of GameTooltip for the plugin tooltip.
VAR: parent - reference to the frame to attach the tooltip to
VAR: anchorPoint - tooltip anchor location (side or corner) to use
VAR: relativeToFrame - string name name of the frame, usually the plugin), to attach the tooltip to
VAR: relativePoint - parent anchor location (side or corner) to use
VAR: xOffset - X offset from the anchor point
VAR: yOffset - Y offset from the anchor point
VAR: frame - reference to the tooltip
OUT:  None
--]]
local function TitanTooltip_SetOwnerPosition(parent, anchorPoint, relativeToFrame, relativePoint, xOffset, yOffset, frame)
	if not frame then
		frame = _G["GameTooltip"]
	end
	-- Changes for 9.1.5 Removed the background template from the GameTooltip
	-- Making changes to it difficult and possibly changing the tooltip globally.

	frame:SetOwner(parent, "ANCHOR_NONE");
	frame:SetPoint(anchorPoint, relativeToFrame, relativePoint,
		xOffset, yOffset);

	-- set font size for the Game Tooltip
	if not TitanPanelGetVar("DisableTooltipFont") then
		if TitanTooltipScaleSet < 1 then
		TitanTooltipOrigScale = frame:GetScale();
		TitanTooltipScaleSet = TitanTooltipScaleSet + 1;
		end
		frame:SetScale(TitanPanelGetVar("TooltipFont"));
	end
end

--[[ local
NAME: TitanTooltip_SetGameTooltip
DESC: Helper to set the tooltip of the given Titan plugin.
First check for a custom function. If no function then use the plugin tooltip title and text.
VAR: self - frame reference of the plugin
OUT:  None
NOTE:
- If a custom function is given pcall (protected call) is used in case the function errors out. Currently the error is allowed to occur silently because it could generate a lot of text to chat.
:NOTE
--]]
local function TitanTooltip_SetGameTooltip(self)
	if ( self.tooltipCustomFunction ) then
--[
		local tmp_txt = ""
		local call_success
		call_success, -- for pcall
			tmp_txt = pcall (self.tooltipCustomFunction)
--]]
--		self.tooltipCustomFunction();
	elseif ( self.tooltipTitle ) then
		GameTooltip:SetText(self.tooltipTitle,
			HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
		if ( self.tooltipText ) then
			TitanTooltip_AddTooltipText(self.tooltipText);
		end
	end

	GameTooltip:Show();
end

--[[ local
NAME: TitanTooltip_SetPanelTooltip
DESC: Helper to set the screen position of the tooltip of the given Titan plugin.
VAR: self - frame reference of the plugin
VAR: id - string name of the plugin
VAR: frame - reference to the tooltip
OUT:  None
--]]
local function TitanTooltip_SetPanelTooltip(self, id, frame)
	-- sanity checks
	if not TitanPanelGetVar("ToolTipsShown")
	or (TitanPanelGetVar("HideTipsInCombat") and InCombatLockdown()) then return end

	if not self.tooltipCustomFunction and not self.tooltipTitle then return end

	-- Set GameTooltip
	local button = TitanUtils_GetButton(id);

	-- Adjust the Y offset as needed
	local rel_y = self:GetTop() - GameTooltip:GetHeight()
	if rel_y > 0 then 
		pt = "TOP";
		rel_pt = "BOTTOM";
	else
		-- too close to bottom of screen
		pt = "BOTTOM";
		rel_pt = "TOP";
	end
	local rel_x = self:GetLeft() + GameTooltip:GetHeight()
	if ( rel_x < GetScreenWidth() ) then
		-- menu will fit
		pt = pt.."LEFT";
		rel_pt = rel_pt.."LEFT";
	else
		pt = pt.."RIGHT";
		rel_pt = rel_pt.."RIGHT";
	end

--[[
print("_tooltip"
.." "..tostring(self:GetName())..""
.." "..tostring(pt)..""
.." "..tostring(rel_pt)..""
.." "..tostring(format("%0.1f", GameTooltip:GetWidth()))..""
.." "..tostring(format("%0.1f", GameTooltip:GetHeight()))..""
)
--]]
	TitanTooltip_SetOwnerPosition(button, pt, button:GetName(), rel_pt, 0, 0, frame)
	TitanTooltip_SetGameTooltip(self);
end

--[[ local
NAME: TitanPanelButton_SetTooltip
DESC: Set the tooltip of the given Titan plugin.
VAR: self - frame reference of the plugin
VAR: id - string name of the plugin
--]]
local function TitanPanelButton_SetTooltip(self, id)
	-- ensure that the 'self' passed is a valid frame reference
	if not self:GetName() then return end

	local call_success = nil
	local tmp_txt = ""
	local use_mod = TitanAllGetVar("UseTooltipModifer")
	local use_alt = TitanAllGetVar("TooltipModiferAlt")
	local use_ctrl = TitanAllGetVar("TooltipModiferCtrl")
	local use_shift = TitanAllGetVar("TooltipModiferShift")
	local ok = false
	
	if use_mod then
		if (use_alt and IsAltKeyDown())
		or (use_ctrl and IsControlKeyDown())
		or (use_shift and IsShiftKeyDown())
		then
			ok = true
		end
	else
		ok = true
	end

	self.tooltipCustomFunction = nil;
	if ok and (id and TitanUtils_IsPluginRegistered(id)) then
		local plugin = TitanUtils_GetPlugin(id);
		if ( plugin.tooltipCustomFunction ) then
			self.tooltipCustomFunction = plugin.tooltipCustomFunction;
			TitanTooltip_SetPanelTooltip(self, id);
		elseif ( plugin.tooltipTitle ) then
			local tooltipTextFunc = _G[plugin.tooltipTextFunction];
			if ( tooltipTextFunc ) then

				if ok then  -- display the tooltip
					self.tooltipTitle = plugin.tooltipTitle;
					call_success, -- for pcall
						tmp_txt = pcall (tooltipTextFunc);
					self.tooltipText = tmp_txt
	--				self.tooltipText = tooltipTextFunc();
					TitanTooltip_SetPanelTooltip(self, id);
				end
			end
		end
	end
end

--[[ local
NAME: TitanPanelButton_IsText
DESC: Is the given Titan plugin of type text?
VAR: id - string name of the plugin
OUT: boolean
--]]
local function TitanPanelButton_IsText(id)
	if (TitanPanelButton_GetType(id) == TITAN_PANEL_BUTTON_TYPE_TEXT) then
		return 1;
	end
end

--[[ local
NAME: TitanPanelButton_IsCombo
DESC: Is the given Titan plugin of type combo?
VAR:  id - string name of the plugin
OUT: boolean
--]]
local function TitanPanelButton_IsCombo(id)
	if (TitanPanelButton_GetType(id) == TITAN_PANEL_BUTTON_TYPE_COMBO) then
		return 1;
	end
end

--[[ Titan
NAME: TitanPanelButton_IsIcon
DESC: Is the given Titan plugin of type icon?
VAR: id - string name of the plugin
OUT: boolean
--]]
function TitanPanelButton_IsIcon(id)
	if (TitanPanelButton_GetType(id) == TITAN_PANEL_BUTTON_TYPE_ICON) then
		return 1;
	end
end

--[[ local
NAME: TitanPanelButton_IsCustom
DESC: Is the given Titan plugin of type custom?
VAR: id - string name of the plugin
OUT: boolean
--]]
local function TitanPanelButton_IsCustom(id)
	if (TitanPanelButton_GetType(id) == TITAN_PANEL_BUTTON_TYPE_CUSTOM) then
		return 1;
	end
end

--[[ local
NAME: TitanPanelButton_OnDragStart
DESC: Handle the OnDragStart event of the given Titan plugin.
VAR:  self - frame reference of the plugin
VAR: ChildButton - boolean
OUT:  None
NOTE:
- Do nothing if the user has locked plugins or if in combat.
- Set the .isMoving of the plugin (frame) so other routine can check it.
- Set TITAN_PANEL_MOVING so any Titan routine will know a 'drag & drop' is in progress.
- Set TITAN_PANEL_MOVE_ADDON so sanity checks can be done on the 'drop'.
:NOTE
--]]
local function TitanPanelButton_OnDragStart(self, ChildButton)
	if TitanPanelGetVar("LockButtons") or InCombatLockdown() then return end

	local frname = self;
	if ChildButton then
		frname = self:GetParent();
	end

	-- Clear button positions or we'll grab the button and all buttons 'after'
	local i,j;
	for i, j in pairs(TitanPanelSettings.Buttons) do
		local pluginid = _G[TitanUtils_ButtonName(TitanPanelSettings.Buttons[i])];
		if pluginid then
			pluginid:ClearAllPoints()
		end
	end

	-- Start the drag; close any tooltips and open control frames
	frname:StartMoving();
	frname.isMoving = true;
	TitanUtils_CloseAllControlFrames();
	TitanPanelRightClickMenu_Close();
	if AceLibrary then
		if AceLibrary:HasInstance("Dewdrop-2.0") then
			AceLibrary("Dewdrop-2.0"):Close()
		end
		if AceLibrary:HasInstance("Tablet-2.0") then
			AceLibrary("Tablet-2.0"):Close()
		end
	end
	GameTooltip:Hide();
	-- LibQTip-1.0 support code
	LibQTip = LibStub("LibQTip-1.0", true)
	if LibQTip then
		local key, tip
		for key, tip in LibQTip:IterateTooltips() do
			if tip then
				local _, relativeTo = tip:GetPoint()
					if relativeTo and relativeTo:GetName() == self:GetName() then
						tip:Hide()
						break
					end
			end
		end
	end
	-- /LibQTip-1.0 support code

	-- Hold the plugin id so we can do checks on the drop
	TITAN_PANEL_MOVE_ADDON = TitanUtils_GetButtonID(self:GetName());
	if ChildButton then
		TITAN_PANEL_MOVE_ADDON =
			TitanUtils_GetButtonID(self:GetParent():GetName());
	end
	-- Tell Titan that a drag & drop is in process
	TITAN_PANEL_MOVING = 1;
	-- Store the OnEnter handler so the tooltip does not show - or other oddities
	pluginOnEnter = self:GetScript("OnEnter")
	self:SetScript("OnEnter", nil)
end

--[[ local
NAME: TitanPanelButton_OnDragStop
DESC: Handle the OnDragStop event of the given Titan plugin.
VAR: self - frame reference of the plugin
VAR: ChildButton - boolean
OUT:  None
NOTE:
- Clear the .isMoving of the plugin (frame).
- Clear TITAN_PANEL_MOVING.
- Clear TITAN_PANEL_MOVE_ADDON.
:NOTE
--]]
local function TitanPanelButton_OnDragStop(self, ChildButton)
	if TitanPanelGetVar("LockButtons") then
		return
	end
	local ok_to_move = true
	local nonmovableFrom = false;
	local nonmovableTo = false;
	local frname = self;
	if ChildButton then
		frname = self:GetParent();
	end
	if TITAN_PANEL_MOVING == 1 then
		frname:StopMovingOrSizing();
		frname.isMoving = false;
		TITAN_PANEL_MOVING = 0;

		-- See if the plugin is supposed to stay on the bar it is on
		if TitanGetVar(TITAN_PANEL_MOVE_ADDON, "ForceBar") then
			ok_to_move = false
		end

		-- eventually there could be several reasons to not allow
		-- the plugin to move
		if ok_to_move then
			local i,j;
			for i, j in pairs(TitanPanelSettings.Buttons) do
				local pluginid =
					_G[TitanUtils_ButtonName(TitanPanelSettings.Buttons[i])];
--					_G["TitanPanel"..TitanPanelSettings.Buttons[i].."Button"];
				if (pluginid and MouseIsOver(pluginid)) and frname ~= pluginid then
					TITAN_PANEL_DROPOFF_ADDON = TitanPanelSettings.Buttons[i];
				end
			end

			-- switching sides is not allowed
			nonmovableFrom = TitanUtils_ToRight(TITAN_PANEL_MOVE_ADDON)
			nonmovableTo = TitanUtils_ToRight(TITAN_PANEL_DROPOFF_ADDON)
			if nonmovableTo ~= nonmovableFrom then
				TITAN_PANEL_DROPOFF_ADDON = nil;
			end

			if TITAN_PANEL_DROPOFF_ADDON == nil then
				-- See if the plugin was dropped on a bar rather than
				-- another plugin.
				local bar
				local tbar = nil
				-- Find which bar it was dropped on
				for idx,v in pairs(TitanBarData) do
					bar = idx
					if (bar and MouseIsOver(_G[bar])) then
						tbar = bar
					end
				end

				if tbar then
					TitanPanel_RemoveButton(TITAN_PANEL_MOVE_ADDON)
					TitanUtils_AddButtonOnBar(TitanBarData[tbar].name, TITAN_PANEL_MOVE_ADDON)
				else
					-- not sure what the user did...
				end
			else
				-- plugin was dropped on another plugin - swap (for now)
				local dropoff = TitanUtils_GetCurrentIndex(TitanPanelSettings.Buttons
					,TITAN_PANEL_DROPOFF_ADDON);
				local pickup = TitanUtils_GetCurrentIndex(TitanPanelSettings.Buttons
					,TITAN_PANEL_MOVE_ADDON);
				local dropoffbar = TitanUtils_GetWhichBar(TITAN_PANEL_DROPOFF_ADDON);
				local pickupbar = TitanUtils_GetWhichBar(TITAN_PANEL_MOVE_ADDON);

				if dropoff ~= nil and dropoff ~= "" then
		-- TODO: Change to 'insert' rather than swap
					TitanPanelSettings.Buttons[dropoff] = TITAN_PANEL_MOVE_ADDON;
					TitanPanelSettings.Location[dropoff] = dropoffbar;
					TitanPanelSettings.Buttons[pickup] = TITAN_PANEL_DROPOFF_ADDON;
					TitanPanelSettings.Location[pickup] = pickupbar;
				end
			end
		end

		-- This is important! The start drag cleared the button positions so
		-- the buttons need to be put back properly.
		TitanPanel_InitPanelButtons();
		TITAN_PANEL_MOVE_ADDON = nil;
		TITAN_PANEL_DROPOFF_ADDON = nil;
		-- Restore the OnEnter script handler
		if pluginOnEnter then self:SetScript("OnEnter", pluginOnEnter) end
		pluginOnEnter = nil;
	end
end

--[[ API
NAME: TitanOptionSlider_TooltipText
DESC: Set the color of the tooltip text to normal (white) with the value in green.
VAR: text - the label for value
VAR: value - the value
OUT: string - encoded color string of text and value
--]]
function TitanOptionSlider_TooltipText(text, value)
	return (text or "?") .. " " .. GREEN_FONT_COLOR_CODE .. value .. FONT_COLOR_CODE_CLOSE;
end

--[[ API
NAME: TitanPanelButton_OnLoad
DESC: Handle the OnLoad event of the requested Titan plugin. Ensure the plugin is set to be registered.
VAR: isChildButton - boolean
NOTE:
- This is called from the Titan plugin frame in the OnLoad event - usually as the frame is created.
- This starts the plugin registration process. See TitanUtils for more details on plugin registration.
- The plugin registration is a two step process because not all addons create Titan plugins in the frame create. The Titan feature of converting LDB addons to Titan plugins is an example.
:NOTE
--]]
function TitanPanelButton_OnLoad(self, isChildButton) -- Used by plugins
	TitanUtils_PluginToRegister(self, isChildButton)
end

--[[ API
NAME: TitanPanelPluginHandle_OnUpdate
DESC: A method to refresh the display of a Titan plugin.
VAR: table - the frame of the plugin
VAR: oldarg - nil or command
NOTE:
- This is used by some plugins. It is not used within Titan.
- The expected usage is either:
1) Table contains {<plugin id>, <update command>}
2) table = <plugin id> and oldarg = <update command>
- oldarg - nil or command
1 = refresh button
2 = refresh tooltip
3 = refresh button and tooltip
:NOTE
--]]
function TitanPanelPluginHandle_OnUpdate(table, oldarg) -- Used by plugins
	local id, updateType = nil, nil
	-- set the id and updateType
	-- old method
	if table and type(table) == "string" and oldarg then
		id = table
		updateType = oldarg
	end
	-- new method
	if table and type(table) == "table" then
		if table[1] then id = table[1] end
		if table[2] then updateType = table[2] end
	end

	-- id is required
	if id then
		if updateType == TITAN_PANEL_UPDATE_BUTTON
		or updateType == TITAN_PANEL_UPDATE_ALL then
			TitanPanelButton_UpdateButton(id)
		end

		if (updateType == TITAN_PANEL_UPDATE_TOOLTIP
		or updateType == TITAN_PANEL_UPDATE_ALL)
		and MouseIsOver(_G[TitanUtils_ButtonName(id)]) then
			if TitanPanelRightClickMenu_IsVisible() or TITAN_PANEL_MOVING == 1 then
				return
			end

			TitanPanelButton_SetTooltip(_G[TitanUtils_ButtonName(id)], id)
		end
	end
end

--[[ API
NAME: TitanPanelDetectPluginMethod
DESC: Poorly named routine that sets the OnDragStart & OnDragStop scripts of a Titan plugin.
VAR: id - the string name of the plugin
VAR: isChildButton - boolean
--]]
function TitanPanelDetectPluginMethod(id, isChildButton)
	-- Ensure the id is not nil
	if not id then return end
	local TitanPluginframe = _G[TitanUtils_ButtonName(id)];
	if isChildButton then
		TitanPluginframe = _G[id];
	end
	-- Ensure the frame is valid
	if not TitanPluginframe and TitanPluginframe:GetName() then return end -- sanity check...

	-- Set the OnDragStart script
	TitanPluginframe:SetScript("OnDragStart", function(self)
		if not IsShiftKeyDown()
		and not IsControlKeyDown()
		and not IsAltKeyDown() then
			if isChildButton then
				TitanPanelButton_OnDragStart(self, true);
			else
				TitanPanelButton_OnDragStart(self);
			end
		end
	end)

	-- Set the OnDragStop script
	TitanPluginframe:SetScript("OnDragStop", function(self)
		if isChildButton then
			TitanPanelButton_OnDragStop(self, true)
		else
			TitanPanelButton_OnDragStop(self);
		end
	end)
--[[
	-- Set the key down script - for modifiers
	TitanPluginframe:SetScript("OnKeyDown", function(self)
		if IsModifierKeyDown() then
			TitanPanelButton_SetTooltip(self, id)
		end
	end)

	-- Set the key up script - for modifiers
	TitanPluginframe:SetScript("OnKeyUp", function(self)
		if IsModifierKeyDown() then
			-- ? do nothing
		else
			GameTooltip:Hide()
		end
	end)
--]]
end

--[[ API
NAME: TitanPanelButton_OnShow
DESC: Handle the OnShow event of the requested Titan plugin.
VAR:self - frame reference of the plugin
--]]
function TitanPanelButton_OnShow(self) -- Used by plugins
	local id = nil;
	-- ensure that the 'self' passed is a valid frame reference
	if self and self:GetName() then
		id = TitanUtils_GetButtonID(self:GetName());
	end
	-- ensure that id is a valid Titan plugin
	if (id) then
		TitanPanelButton_UpdateButton(id, 1);
	end
end

--[[ API
NAME: TitanPanelButton_OnClick
DESC: Handle the OnClick mouse event of the requested Titan plugin.
VAR: self - frame reference of the plugin
VAR: button - mouse button that was clicked
VAR: isChildButton - boolean ! NO LONGER USED !
NOTE:
- Only the left and right mouse buttons are handled by Titan.
:NOTE
--]]
function TitanPanelButton_OnClick(self, button, isChildButton) -- Used by plugins
	local id
	-- ensure that the 'self' passed is a valid frame reference
	if self and self:GetName() then
		id = TitanUtils_Ternary(isChildButton,
			TitanUtils_GetParentButtonID(self:GetName()),
			TitanUtils_GetButtonID(self:GetName()));
	end

--[[
if self.TitanType == "macro" then
print("TPB OnClick"
.." "..tostring(self:GetName()).." "
.." "..tostring(button).." "
.." "..tostring(issecure()).." "
.." "..tostring(self:GetAttribute("type")).." "
.." "..tostring(self:GetAttribute("macrotext")).." "
)
end
--]]
	if id then
		local controlFrame = TitanUtils_GetControlFrame(id);

		if (button == "LeftButton") then
			local isControlFrameShown;
			if (not controlFrame) then
				isControlFrameShown = false;
			elseif (controlFrame:IsVisible()) then
				isControlFrameShown = false;
			else
				isControlFrameShown = true;
			end

			TitanUtils_CloseAllControlFrames();
			TitanPanelRightClickMenu_Close();

			local position = TitanUtils_GetWhichBar(id)
			if (isControlFrameShown) then
			
				-- Note: This uses anchor points to place the control frame relative to the plugin on the screen.
				local parent = self:GetName() -- plugin with the control frame
				local point = "" -- point of the control frame
				local rel_point = "" -- The middle - top or bottom edge - of the plugin to anchor to
				--[[ Mar 2023 : removed reference to Titan bar reference
					Instead use the relative position on the screen to show the control (plugin)
					frame properly.
					NOTE: If Titan bars need a left click to show a control frame the offset
					will need to be changed to use the cursor position like right click menu!!
				--]]
				if (self:GetTop() - controlFrame:GetHeight()) > 0 then 
					point = "TOP"
					rel_point = "BOTTOM"
				else -- below screen
					point = "BOTTOM"
					rel_point = "TOP"
				end

				local x = 0
				local y = 0
				
				controlFrame:ClearAllPoints();
				controlFrame:SetPoint(point.."LEFT", parent, rel_point, 0, 0) -- default left of plugin
				
				-- Adjust control frame position if it's off the screen
				local offscreenX, offscreenY = TitanUtils_GetOffscreen(controlFrame);
				if ( offscreenX == -1 ) then 
					-- Off to left of screen which should not happen...
				elseif ( offscreenX == 1 ) then
					-- off to right of screen, flip to right of plugin
					controlFrame:ClearAllPoints();
					controlFrame:SetPoint(point.."RIGHT", parent, rel_point, 0, 0)
				end

				controlFrame:Show();
			end
		elseif (button == "RightButton") then
			TitanUtils_CloseAllControlFrames();
			-- Show RightClickMenu anyway
			TitanPanelRightClickMenu_Close();
			TitanPanelRightClickMenu_Toggle(self);
		end

		GameTooltip:Hide();
	end
end

--[[ API
NAME: TitanPanelButton_OnEnter
DESC: Handle the OnEnter cursor event of the requested Titan plugin.
VAR: self - frame reference of the plugin
VAR: isChildButton - boolean
NOTE:
- The cursor has moved over the plugin so show the plugin tooltip.
- Save same hassle by doing nothing if the tooltip is already shown or if the cursor is moving.
- If the "is moving" is set the user is dragging this plugin around so do nothing here.
:NOTE
--]]
function TitanPanelButton_OnEnter(self, isChildButton) -- Used by plugins
	local id = nil;
	-- ensure that the 'self' passed is a valid frame reference
	if self and self:GetName() then
		id = TitanUtils_Ternary(isChildButton,
			TitanUtils_GetParentButtonID(self:GetName()),
			TitanUtils_GetButtonID(self:GetName()));
	end

	if (id) then
		local controlFrame = TitanUtils_GetControlFrame(id);
		if (controlFrame and controlFrame:IsVisible()) then
			return;
		elseif (TitanPanelRightClickMenu_IsVisible()) then
			return;
		else
			if TITAN_PANEL_MOVING == 0 then
				TitanPanelButton_SetTooltip(self, id);
			end
			if self.isMoving then
				GameTooltip:Hide();
			end
		end
	end
end

--[[ API
NAME: TitanPanelButton_OnLeave
DESC: Handle the OnLeave cursor event of the requested Titan plugin.
VAR: self - frame reference of the plugin
VAR: isChildButton - boolean
NOTE:
- The cursor has moved off the plugin so hide the plugin tooltip.
:NOTE
--]]
function TitanPanelButton_OnLeave(self, isChildButton)
	local id = nil;
	-- ensure that the 'self' passed is a valid frame reference
	if self and self:GetName() then
		id = TitanUtils_Ternary(isChildButton,
			TitanUtils_GetParentButtonID(self:GetName()),
			TitanUtils_GetButtonID(self:GetName()));
	end

	if (id) then
		GameTooltip:Hide();
	end

	if not TitanPanelGetVar("DisableTooltipFont") then
		-- reset original Tooltip Scale
		GameTooltip:SetScale(TitanTooltipOrigScale);
		TitanTooltipScaleSet = 0;
	end
end

-- local routines for Update Button
--[[ local
NAME: TitanPanelButton_SetButtonText
DESC: Set / update the text of the given Titan plugin.
VAR: id - string name of the plugin
NOTE:
- The plugin is expected to tell Titan what routine is to be called in <self>.registry.buttonTextFunction.
- The text routine is called in protected mode (pcall) to ensure the Titan main routines still run.
:NOTE
--]]
local format_with_label = { [0] = "" }
for idx = 1, 4 do format_with_label[idx] = "%s%s" .. (TITAN_PANEL_LABEL_SEPARATOR .. "%s%s"):rep(idx - 1) end
local function TitanPanelButton_SetButtonText(id)
	if not (id and TitanUtils_IsPluginRegistered(id)) then return end

	local buttonTextFunction = _G[TitanUtils_GetPlugin(id).buttonTextFunction];
	if not buttonTextFunction then return end
	local button = TitanUtils_GetButton(id);
	local buttonText = _G[button:GetName()..TITAN_PANEL_TEXT];

	local newfont = media:Fetch("font", TitanPanelGetVar("FontName"))
	if newfont then
		buttonText:SetFont(newfont, TitanPanelGetVar("FontSize"))
	end

	-- We'll be paranoid here and call the button text in protected mode.
	-- In case the button text fails it will not take Titan with it...
	local call_success, -- for pcall
		label1, value1, label2, value2, label3, value3, label4, value4 =
			pcall(buttonTextFunction, id)

	if call_success then 
		-- All is good
	else
		buttonText:SetText("<?>")
--[[
		local msg = tostring(id).." '"..label1.."'"
		TitanPrint(msg, "error")
--]]
		return 
	end

	--=====================================
	-- Determine the label value pairs : 1 - 4
	-- Each could be custom per user
	--
	-- NummLabelsSeen - used for the config to avoid confusing user
	-- Plugin MUST have been shown at least once.

	-- In the case of first label only (no value), set the button and return.
	if label1 and
		not (label2 or label3 or label4
		or value1 or value2 or value3 or value4) then
		buttonText:SetText(label1)
		
		TitanSetVar(id, "NumLabelsSeen", 1)

		return
	end


	local show_label = TitanGetVar(id, "ShowLabelText")
	local values = 0
	if label1 or value1 then
		values = 1
		if show_label then 
			if TitanGetVar(id, "CustomLabelTextShow") then
				-- override the label per the user
				label1 = TitanGetVar(id, "CustomLabelText")
			else
			end
		else
			label1 = "" 
		end
		if label2 or value2 then
			values = 2
			if show_label then 
				if TitanGetVar(id, "CustomLabel2TextShow") then
					-- override the label per the user
					label2 = TitanGetVar(id, "CustomLabel2Text")
				else
				end
			else
				label2 = "" 
			end
			if label3 or value3 then
				if show_label then 
					if TitanGetVar(id, "CustomLabel3TextShow") then
						-- override the label per the user
						label3 = TitanGetVar(id, "CustomLabel3Text")
					else
					end
				else
					label3 = "" 
				end
				values = 3
				if label4 or value4 then
					values = 4
					if show_label then 
						if TitanGetVar(id, "CustomLabel43TextShow") then
							-- override the label per the user
							label4 = TitanGetVar(id, "CustomLabel4Text")
						else
						end
					else
						label4 = "" 
					end
				end
			end
		end
	end

	TitanSetVar(id, "NumLabelsSeen", values)
	
	-- values tells which format to use from the array
	buttonText:SetFormattedText(format_with_label[values],
		label1 or "", value1 or "",
		label2 or "", value2 or "",
		label3 or "", value3 or "",
		label4 or "", value4 or ""
	)
end

--[[ local
NAME: TitanPanelButton_SetTextButtonWidth
DESC: Set the text width of the given Titan plugin that is text only.
VAR: id - string name of the plugin
VAR: setButtonWidth - new width
NOTE:
- Titan uses a tolerance setting to prevent endless updating of the text width.
:NOTE
--]]
local function TitanPanelButton_SetTextButtonWidth(id, setButtonWidth)
	if (id) then
		local button = TitanUtils_GetButton(id);
		local text = _G[button:GetName()..TITAN_PANEL_TEXT];
		if ( setButtonWidth
		or button:GetWidth() == 0
		or button:GetWidth() - text:GetWidth() > TITAN_PANEL_BUTTON_WIDTH_CHANGE_TOLERANCE
		or button:GetWidth() - text:GetWidth() < -TITAN_PANEL_BUTTON_WIDTH_CHANGE_TOLERANCE ) then
			button:SetWidth(text:GetWidth());
			TitanPanelButton_Justify();
		end
	end
end

--[[ local
NAME: TitanPanelButton_SetIconButtonWidth
DESC: Set the icon width of the given Titan plugin that is icon only.
VAR: id - string name of the plugin
NOTE:
- The plugin is expected to tell Titan what the icon width is in <self>.registry.iconButtonWidth.
:NOTE
--]]
local function TitanPanelButton_SetIconButtonWidth(id)
	if (id) then
		local button = TitanUtils_GetButton(id);
		if ( TitanUtils_GetPlugin(id).iconButtonWidth ) then
			button:SetWidth(TitanUtils_GetPlugin(id).iconButtonWidth);
		end
	end
end

--[[ local
NAME: TitanPanelButton_SetComboButtonWidth
DESC: Set the icon width of the given Titan plugin that is a combo - icon & text.
VAR: id - string name of the plugin
VAR: setButtonWidth - new width
NOTE:
- The plugin is expected to tell Titan what the icon width is in <self>.registry.iconButtonWidth.
:NOTE
--]]
local function TitanPanelButton_SetComboButtonWidth(id, setButtonWidth)
	if (id) then
		local button = TitanUtils_GetButton(id)
		if not button then return end -- sanity check

		local text = _G[button:GetName()..TITAN_PANEL_TEXT];
		local icon = _G[button:GetName().."Icon"];
		local iconWidth, iconButtonWidth, newButtonWidth;

		-- Get icon button width
		iconButtonWidth = 0;
		if ( TitanUtils_GetPlugin(id).iconButtonWidth ) then
			iconButtonWidth = TitanUtils_GetPlugin(id).iconButtonWidth;
		elseif ( icon:GetWidth() ) then
			iconButtonWidth = icon:GetWidth();
		end

		if ( TitanGetVar(id, "ShowIcon") and ( iconButtonWidth ~= 0 ) ) then
			icon:Show();
			text:ClearAllPoints();
			text:SetPoint("LEFT", icon:GetName(), "RIGHT", 2, 1);

			newButtonWidth = text:GetWidth() + iconButtonWidth;
		else
			icon:Hide();
			text:ClearAllPoints();
			text:SetPoint("LEFT", button:GetName(), "LEFT", 0, 1);

			newButtonWidth = text:GetWidth();
		end

		if ( setButtonWidth
		or button:GetWidth() == 0
		or button:GetWidth() - newButtonWidth > TITAN_PANEL_BUTTON_WIDTH_CHANGE_TOLERANCE
		or button:GetWidth() - newButtonWidth < -TITAN_PANEL_BUTTON_WIDTH_CHANGE_TOLERANCE )
		then
			button:SetWidth(newButtonWidth);
			TitanPanelButton_Justify();
		end
	end
end

--[[ API
NAME: TitanPanelButton_UpdateButton
DESC: Update the display of the given Titan plugin.
VAR: id - string name of the plugin
VAR: setButtonWidth - new width
--]]
function TitanPanelButton_UpdateButton(id, setButtonWidth)  -- Used by plugins
	local button, id = TitanUtils_GetButton(id);
	local plugin = TitanUtils_GetPlugin(id)
	-- safeguard to avoid errors
	if not TitanUtils_IsPluginRegistered(id) then return end

	if ( TitanPanelButton_IsText(id) ) then
		-- Update textButton
		TitanPanelButton_SetButtonText(id);
		TitanPanelButton_SetTextButtonWidth(id, setButtonWidth);

	elseif ( TitanPanelButton_IsIcon(id) ) then
		-- Update iconButton
		TitanPanelButton_SetButtonIcon(id, (plugin.iconCoords or nil),
			(plugin.iconR or nil),(plugin.iconG or nil),(plugin.iconB or nil)
			);
		TitanPanelButton_SetIconButtonWidth(id);

	elseif ( TitanPanelButton_IsCombo(id) ) then
		-- Update comboButton
		TitanPanelButton_SetButtonText(id);
		TitanPanelButton_SetButtonIcon(id, (plugin.iconCoords or nil),
			(plugin.iconR or nil),(plugin.iconG or nil),(plugin.iconB or nil)
			);
		TitanPanelButton_SetComboButtonWidth(id, setButtonWidth);
	end
end


--[[ API
NAME: TitanPanelButton_UpdateTooltip
DESC: Update the tooltip of the given Titan plugin.
VAR: self - frame reference of the plugin
--]]
function TitanPanelButton_UpdateTooltip(self) -- Used by plugins
	if not self then return end
	if (GameTooltip:IsOwned(self)) then
		local id = TitanUtils_GetButtonID(self:GetName());

		TitanPanelButton_SetTooltip(self, id);
	end
end

--[[ API
NAME: TitanPanelButton_SetButtonIcon
DESC: Set the icon of the given Titan plugin.
VAR: id - string name of the plugin
VAR: iconCoords - if given, this is the placing of the icon within the plugin
VAR: iconR - if given, this is the Red (RBG) setting of the icon
VAR: iconG - if given, this is the Green (RBG) setting of the icon
VAR: iconB - if given, this is the Blue (RBG) setting of the icon
--]]
function TitanPanelButton_SetButtonIcon(id, iconCoords, iconR, iconG, iconB)
	if (id and TitanUtils_IsPluginRegistered(id)) then
		local button = TitanUtils_GetButton(id);
		local icon = _G[button:GetName().."Icon"];
		local iconTexture = TitanUtils_GetPlugin(id).icon;
		local iconWidth = TitanUtils_GetPlugin(id).iconWidth;

		if (iconTexture) and icon then
			icon:SetTexture(iconTexture);
		end
		if (iconWidth) and icon then
			icon:SetWidth(iconWidth);
		end

		-- support for iconCoords, iconR, iconG, iconB attributes
		if iconCoords and icon then
			icon:SetTexCoord(unpack(iconCoords))
		end
		if iconR and iconG and iconB and icon then
			icon:SetVertexColor(iconR, iconG, iconB)
		end
	end
end

--[[ Titan
NAME: TitanPanelButton_GetType
DESC: Get the type of the given Titan plugin.
VAR: id - string name of the plugin
OUT: type - The type of the plugin (text, icon, combo (default))
NOTE:
- This assumes that the developer is playing nice and is using the Titan templates as is...
:NOTE
--]]
function TitanPanelButton_GetType(id)
	-- id is required
	if (not id) then
		return;
	end

	local button = TitanUtils_GetButton(id);
	local type;
	if button then
		local text = _G[button:GetName()..TITAN_PANEL_TEXT];
		local icon = _G[button:GetName().."Icon"];

		if (text and icon) then
			type = TITAN_PANEL_BUTTON_TYPE_COMBO;
		elseif (text and not icon) then
			type = TITAN_PANEL_BUTTON_TYPE_TEXT;
		elseif (not text and icon) then
			type = TITAN_PANEL_BUTTON_TYPE_ICON;
		elseif (not text and not icon) then
			type = TITAN_PANEL_BUTTON_TYPE_CUSTOM;
		end
	else
		type = TITAN_PANEL_BUTTON_TYPE_COMBO;
	end

	return type;
end

--[[ Titan
NAME: TitanPanelButton_ApplyBarPos
DESC: Apply saved Bar position to the Bar frame.
VAR: frame_str - string name of the Bar frame
OUT: None
NOTE:
- Bit of a sledge hammer; used when loading a profile over the current so the Bars are properly placed.
:NOTE
--]]
function TitanPanelButton_ApplyBarPos(frame_str)
	local frame = _G[frame_str]
	local bdata = TitanBarData[frame_str]
	if frame then
		frame:ClearAllPoints();
		if bdata.user_move then
			local x, y, w = TitanVariables_GetBarPos(frame_str)
			frame:SetPoint(bdata.show.pt, bdata.show.rel_fr, bdata.show.rel_pt, x, y)
		else
			-- full bar, ignore
		end
	end
end

--[[ Titan
NAME: TitanOptionsSliderTemplate_OnLoad
DESC: Loads the Backdrop for TitanOptionsSliderTemplate with new 9.0 API
VAR: self - The frame
--]]
function TitanOptionsSliderTemplate_OnLoad(self)
		self:SetBackdrop({
			bgFile="Interface\\Buttons\\UI-SliderBar-Background",
			edgeFile="Interface\\Buttons\\UI-SliderBar-Border",
			tile = true,
			insets = {
				left = 6,
				right = 6,
				top = 3,
				bottom = 3,
			},
			tileSize = 8,
			edgeSize = 8,
		})
end