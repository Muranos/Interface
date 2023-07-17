--[[ File
NAME: TitanVariables.lua
DESC: This file contains the routines to initialize, get, and set the basic data structures used by Titan. 
It also sets the global variables and constants used by Titan.

TitanBarData ^^: Titan static bar reference and placement info
TitanAll is used for settings used for Titan itself such as use global profile, tootip modifier, etc.
TitanSettings, TitanSkins, ServerTimeOffsets, ServerHourFormat are the structures saved to disk (listed in toc).
TitanSettings : is the table that holds the Titan variables by character and the plugins used by that character.
TitanSkins : holds the list of Titan and custom skins available to the user. 
   It is assumed that the skins are in the proper folder on the hard drive. Blizzard does not allow addons to access the disk.
ServerTimeOffsets and ServerHourFormat: are the tables that hold the user selected hour offset and display format per realm (server).


TitanSettings has major sections with associated shortcuts in the code
TitanPlayerSettings =		TitanSettings.Players[toon]
TitanPluginSettings =		TitanSettings.Players[toon].Plugins		: Successful registered plugins with all flags
TitanPanelSettings =		TitanSettings.Players[toon].Panel		: **
TitanPanelRegister =		TitanSettings.Players[toon].Register	: .registry of all plugins (Titan and LDB) to be registered with Titan
TitanBarDataVars ^^=		TitanSettings.Players[toon].BarVars		: Titan user selected placement info
TitanAdjustSettings =			TitanSettings.Players[toon].Adjust		: List of frames Titan can adjust, vertically only

** : 
- Has Plugin placement data under Location and Buttons
- Bar settings Show / Hide, transparency, skins, etc
- Per character Titan settings plugin spacing, global skin, etc

^^ : 
- The index is the string name of the Titan Bar to coordinate staic and user selected bar data
:DESC
--]]

local L = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)
local _G = getfenv(0);
local media = LibStub("LibSharedMedia-3.0")

if (GetLocale() == "ruRU") then
	-- Special fix for Russian - "Friz Quadrata TT" does not seem to work
	TITAN_PANEL_CONSTANTS.FONT_NAME = "Arial Narrow"
end
local TPC = TITAN_PANEL_CONSTANTS -- shortcut

--[[ Titan
NAME: Titan bar overview
DESC:
-- 3 button frames are used to create a Titan bar: 
-- the 'display' button frame - the bar itself, 
-- the 'hider' which is a blank 1/2 height bar to capture the cursor moving to the bar, 
-- and the 'auto hide' plugin displaying the 'push pin' button.
:DESC
--]]

--[[ Titan
NAME: TitanBarData table. 
DESC:
The table holds:
- the name of each Titan bar (as the index)
- the short name of the bar 
- whether the bar is relative - top or bottom or short (user placed)
- the order they should be considered
- SetPoint values for show / hide
- short bar specific values 
 
The short name is used to build names of the various saved variables, frames,
 and buttons used by Titan.
:DESC
-]]
local SHORT_WIDTH = 200
local y_top = GetScreenHeight()  -- * UIParent:GetEffectiveScale()
local x_max = GetScreenWidth()
local x_mid = (GetScreenWidth() / 2) - (SHORT_WIDTH / 2)

local function Calc_Y(n)
	return (GetScreenHeight() - (TITAN_PANEL_BAR_HEIGHT * n))
end
local function Calc_X()
	return (GetScreenWidth() / 2) - (SHORT_WIDTH / 2)
end

--[[
--]]
TitanBarData = {
	[TITAN_PANEL_DISPLAY_PREFIX.."Bar"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Bar",
		locale_name = L["TITAN_PANEL_MENU_TOP"],
		name = "Bar", vert = TITAN_TOP, order = 1,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Bar",
		hider = TITAN_PANEL_HIDE_PREFIX.."Bar",
		hide_y = (TITAN_PANEL_BAR_HEIGHT * 3),
		plugin_y_offset = 1,
		plugin_x_offset = 5,
		show = {pt="TOPLEFT", rel_fr="UIParent", rel_pt="TOPLEFT",},
		bott = {pt="BOTTOMRIGHT", rel_fr="UIParent", rel_pt="TOPRIGHT",},
		user_move = false,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Bar2"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Bar2",
		locale_name = L["TITAN_PANEL_MENU_TOP2"],
		name = "Bar2", vert = TITAN_TOP, order = 2,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Bar2",
		hider = TITAN_PANEL_HIDE_PREFIX.."Bar2",
		hide_y = (TITAN_PANEL_BAR_HEIGHT * 10),
		plugin_y_offset = 1,
		plugin_x_offset = 5,
		show = {pt="TOPLEFT", rel_fr="UIParent", rel_pt="TOPLEFT",},
		bott = {pt="BOTTOMRIGHT", rel_fr="UIParent", rel_pt="TOPRIGHT",},
		user_move = false,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."AuxBar2"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."AuxBar2",
		locale_name = L["TITAN_PANEL_MENU_BOTTOM2"],
		name = "AuxBar2",  vert = TITAN_BOTTOM, order = 3,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."AuxBar2",
		hider = TITAN_PANEL_HIDE_PREFIX.."AuxBar2",
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 2),
		plugin_y_offset = 1,
		plugin_x_offset = 5,
		show = {pt="TOPLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		bott = {pt="BOTTOMRIGHT", rel_fr="UIParent", rel_pt="BOTTOMRIGHT",},
		user_move = false,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."AuxBar"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."AuxBar",
		locale_name = L["TITAN_PANEL_MENU_BOTTOM"],
		name = "AuxBar",  vert = TITAN_BOTTOM, order = 4,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."AuxBar",
		hider = TITAN_PANEL_HIDE_PREFIX.."AuxBar",
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 3),
		plugin_y_offset = 1,
		plugin_x_offset = 5,
		position = {eff_x = 0, eff_y = 0, eff_width = 0},
		show = {pt="TOPLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		bott = {pt="BOTTOMRIGHT", rel_fr="UIParent", rel_pt="BOTTOMRIGHT",},
		user_move = false,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short01"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short01",
		locale_name = SHORT.." 01",
		name = "Short01",  vert = TITAN_SHORT, order = 5,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short01",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short02"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short02",
		locale_name = SHORT.." 02",
		name = "Short02",  vert = TITAN_SHORT, order = 6,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short02",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short03"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short03",
		locale_name = SHORT.." 03",
		name = "Short03",  vert = TITAN_SHORT, order = 7,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short03",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short04"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short04",
		locale_name = SHORT.." 04",
		name = "Short04",  vert = TITAN_SHORT, order = 8,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short04",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short05"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short05",
		locale_name = SHORT.." 05",
		name = "Short05",  vert = TITAN_SHORT, order = 9,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short05",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short06"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short06",
		locale_name = SHORT.." 06",
		name = "Short06",  vert = TITAN_SHORT, order = 10,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short06",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short07"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short07",
		locale_name = SHORT.." 07",
		name = "Short07",  vert = TITAN_SHORT, order = 11,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short07",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short08"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short08",
		locale_name = SHORT.." 08",
		name = "Short08",  vert = TITAN_SHORT, order = 12,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short08",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short09"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short09",
		locale_name = SHORT.." 09",
		name = "Short09",  vert = TITAN_SHORT, order = 13,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short09",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short10"] = {
		frame_name = TITAN_PANEL_DISPLAY_PREFIX.."Short10",
		locale_name = SHORT.." 10",
		name = "Short10",  vert = TITAN_SHORT, order = 14,
		tex_name = TITAN_PANEL_BACKGROUND_PREFIX.."Short10",
		hider = nil,
		hide_y = -(TITAN_PANEL_BAR_HEIGHT * 4),
		plugin_y_offset = 1,
		plugin_x_offset = 10,
		show = {pt="BOTTOMLEFT", rel_fr="UIParent", rel_pt="BOTTOMLEFT",},
		user_move = true,
	},
}

--[[ Titan
NAME: TitanBarPositions table. 
DESC:
The table holds:
- the name of each Titan bar (as the index)
- the X and Y position of the bar 
- the width of the bar
 
The index must be matched to the TitanBarData table!
This table wil be saved under "Players" to rember the placement of Short bars.

The cooresponding Defaults table holds the starting values.
The original Titan (full width) bars values are used for default X and Y
:DESC
-]]
TitanBarDataVars = {}
TitanBarVarsDefaults = {
	["Global"] = -- holds 'global' user settings; NOT for use in the frame loop!
		{
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.NONE, -- Titan_Panel.NONE or Titan_Panel.SKIN or Titan_Panel.COLOR
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Bar"] = {off_x=0, off_y=0, off_w = x_max, 
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN, -- or Titan_Panel.COLOR
		show = true,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Bar2"] = {off_x=0, off_y=-(TITAN_PANEL_BAR_HEIGHT), off_w = x_max, 
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."AuxBar2"] = {off_x=0, off_y=(TITAN_PANEL_BAR_HEIGHT * 2), off_w = x_max,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."AuxBar"] = {off_x=0, off_y=(TITAN_PANEL_BAR_HEIGHT), off_w = x_max,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short01"] = {off_x=x_mid, off_y=Calc_Y(3), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short02"] = {off_x=x_mid, off_y=Calc_Y(4), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short03"] = {off_x=x_mid, off_y=Calc_Y(5), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short04"] = {off_x=x_mid, off_y=Calc_Y(6), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short05"] = {off_x=x_mid, off_y=Calc_Y(7), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short06"] = {off_x=x_mid, off_y=Calc_Y(8), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short07"] = {off_x=x_mid, off_y=Calc_Y(9), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short08"] = {off_x=x_mid, off_y=Calc_Y(10), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short09"] = {off_x=x_mid, off_y=Calc_Y(11), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
	[TITAN_PANEL_DISPLAY_PREFIX.."Short10"] = {off_x=x_mid, off_y=Calc_Y(12), off_w = SHORT_WIDTH,  
		skin = {path = "Interface\\AddOns\\Titan\\Artwork\\", alpha = 0.7},
		color = {r = 1.0, g = .5, b = 1.0, alpha = 1.0},
		texure = Titan_Panel.SKIN,
		show = false,
		auto_hide = false,
		align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,   -- TITAN_PANEL_BUTTONS_ALIGN_CENTER
		hide_in_combat = false,
		},
}

local TitanAdjDefaults = {
		adjust = false,
		offset = 0,
}
Titan_Panel.AdjList = { -- TODO : localize
	["UIWidgetTopCenterContainerFrame"] = {
		frame_name = "UIWidgetTopCenterContainerFrame",
		purpose = "Status for BG / Dungeon",
	}, 
}
TitanAdjustSettings = {} -- holds frames that Titan allows user to adjust

-- Timers used within Titan
TitanTimers = {}

--[[ Titan
TitanPluginToBeRegistered table holds each plugin that is requesting to be a plugin.
TitanPluginToBeRegisteredNum is the number of plugins that have requested.
Each plugin in the table will be updated with the status of the registration and will be available in the Titan Attempted option.
--]]
TitanPluginToBeRegistered = {}
TitanPluginToBeRegisteredNum = 0

TitanPluginRegisteredNum = 0

--[[ Titan
TitanPluginExtras table holds the plugin data for plugins that are in saved variables but not loaded on the current character.
Saved as TitanPlayerSettings.Extra
TitanPluginExtrasNum is the number of plugins not loaded.
--]]
TitanPluginExtras = {}
TitanPluginExtrasNum = 0

-- Global to hold where the Titan menu orginated from...
TitanPanel_DropMenu = nil

local Default_Plugins = {
	{id = "Location", loc = "Bar"},
	{id = "XP", loc = "Bar"},
	{id = "Gold", loc = "Bar"},
	{id = "Clock", loc = "Bar"},
	{id = "Volume", loc = "Bar"},
	{id = "AutoHide_Bar", loc = "Bar"},
	{id = "Bag", loc = "Bar"},
	{id = "Repair", loc = "Bar"},
}
--[[ Titan
TITAN_PANEL_SAVED_VARIABLES table holds the Titan Panel Default SavedVars.
--]]
TITAN_PANEL_SAVED_VARIABLES = {
	Buttons = {},
	Location = {},
	TexturePath = "Interface\\AddOns\\Titan\\Artwork\\",
	Transparency = 0.7,
	AuxTransparency = 0.7,
	Scale = 1,
	ButtonSpacing = 20,
	IconSpacing = 0,
	TooltipTrans = 1,
	TooltipFont = 1,
	DisableTooltipFont = 1,
	FontName = TPC.FONT_NAME,
	FrameStrata = "LOW",
	FontSize = TPC.FONT_SIZE,
	LogAdjust = false,
	MinimapAdjust = false,
	BagAdjust = 1,
	TicketAdjust = 1,
	Position = 1,
	ButtonAlign = 1,
	LockButtons = false,
	LockAutoHideInCombat = false,
	VersionShown = 1,
	ToolTipsShown = 1,
	HideTipsInCombat = false,
	HideBarsInCombat = false,
	HideBarsInPVP = false,
	-- for the independent bars
	Bar_Show = true,
	Bar_Hide = false,
	Bar_Align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,
	Bar_Transparency = 0.7,
	Bar2_Show = false,
	Bar2_Hide = false,
	Bar2_Transparency = 0.7,
	Bar2_Align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,
	AuxBar_Show = false,
	AuxBar_Hide = false,
	AuxBar_Transparency = 0.7,
	AuxBar_Align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,
	AuxBar2_Show = false,
	AuxBar2_Hide = false,
	AuxBar2_Transparency = 0.7,
	AuxBar2_Align = TITAN_PANEL_BUTTONS_ALIGN_LEFT,
};

--[[ Titan
TITAN_ALL_SAVED_VARIABLES table holds the Titan Panel Global SavedVars.
--]]
TITAN_ALL_SAVED_VARIABLES = {
	-- for timers in seconds
	TimerLDB = 2,
	-- Global profile
	GlobalProfileUse = false,
	GlobalProfileName = TITAN_PROFILE_NONE,
	Silenced = false,-- Silent Load : name and version
	Registered = false, -- for debug
	-- OrderHallCommandBar Status
	OrderHall = true,
	UseTooltipModifer = false,
	TooltipModiferAlt = false,
	TooltipModiferCtrl = false,
	TooltipModiferShift = false,
};

-- The skins released with Titan
TitanSkinsDefaultPath = "Interface\\AddOns\\Titan\\Artwork\\"
TitanSkinsCustomPath = TitanSkinsDefaultPath.."Custom\\"
TitanSkinsPathEnd = "\\"
TitanSkinsDefault = {
	{ name = "Titan Default", titan=true, path = TitanSkinsDefaultPath},
	{ name = "AllBlack", titan=true, path = TitanSkinsCustomPath.."AllBlack Skin"..TitanSkinsPathEnd},
	{ name = "BlackPlusOne", titan=true, path = TitanSkinsCustomPath.."BlackPlusOne Skin"..TitanSkinsPathEnd},
	{ name = "Christmas", titan=true, path = TitanSkinsCustomPath.."Christmas Skin"..TitanSkinsPathEnd},
	{ name = "Charcoal Metal", titan=true, path = TitanSkinsCustomPath.."Charcoal Metal"..TitanSkinsPathEnd},
	{ name = "Crusader", titan=true, path = TitanSkinsCustomPath.."Crusader Skin"..TitanSkinsPathEnd},
	{ name = "Cursed Orange", titan=true, path = TitanSkinsCustomPath.."Cursed Orange Skin"..TitanSkinsPathEnd},
	{ name = "Dark Wood", titan=true, path = TitanSkinsCustomPath.."Dark Wood Skin"..TitanSkinsPathEnd},
	{ name = "Deep Cave", titan=true, path = TitanSkinsCustomPath.."Deep Cave Skin"..TitanSkinsPathEnd},
	{ name = "Elfwood", titan=true, path = TitanSkinsCustomPath.."Elfwood Skin"..TitanSkinsPathEnd},
	{ name = "Engineer", titan=true, path = TitanSkinsCustomPath.."Engineer Skin"..TitanSkinsPathEnd},
	{ name = "Frozen Metal", titan=true, path = TitanSkinsCustomPath.."Frozen Metal Skin"..TitanSkinsPathEnd},
	{ name = "Graphic", titan=true, path = TitanSkinsCustomPath.."Graphic Skin"..TitanSkinsPathEnd},
	{ name = "Graveyard", titan=true, path = TitanSkinsCustomPath.."Graveyard Skin"..TitanSkinsPathEnd},
	{ name = "Hidden Leaf", titan=true, path = TitanSkinsCustomPath.."Hidden Leaf Skin"..TitanSkinsPathEnd},
	{ name = "Holy Warrior", titan=true, path = TitanSkinsCustomPath.."Holy Warrior Skin"..TitanSkinsPathEnd},
	{ name = "Nightlife", titan=true, path = TitanSkinsCustomPath.."Nightlife Skin"..TitanSkinsPathEnd},
	{ name = "Orgrimmar", titan=true, path = TitanSkinsCustomPath.."Orgrimmar Skin"..TitanSkinsPathEnd},
	{ name = "Plate", titan=true, path = TitanSkinsCustomPath.."Plate Skin"..TitanSkinsPathEnd},
	{ name = "Tribal", titan=true, path = TitanSkinsCustomPath.."Tribal Skin"..TitanSkinsPathEnd},
	{ name = "X-Perl", titan=true, path = TitanSkinsCustomPath.."X-Perl"..TitanSkinsPathEnd},
};
TitanSkins = {}

-- trim version if it exists
local fullversion = GetAddOnMetadata(TITAN_ID, "Version")
if fullversion then
	local pos = string.find(fullversion, " -", 1, true);
	if pos then
		TITAN_VERSION = string.sub(fullversion,1,pos-1);
	end
end

-- routines to sync toon data
local function CleanupProfile ()
	if TitanPanelSettings and TitanPanelSettings["Buttons"] then
		-- Hide the current set of plugins to prevent overlap (creates a very messy bar!)
		for index, id in pairs(TitanPanelSettings["Buttons"]) do
			local currentButton = 
				TitanUtils_GetButton(TitanPanelSettings["Buttons"][index]);
			-- safeguard
			if currentButton then
			currentButton:Hide();
			end	
		end
	end
	TitanPanelRightClickMenu_Close();
end

--[[ local
NAME: TitanVariables_SyncRegisterSavedVariables
DESC: Helper routine to sync two sets of toon data - Titan settings and loaded plugins.
VAR: registeredVariables - current loaded data (destination)
VAR: savedVariables - data to compare with (source)
OUT:  None
--]]
local function TitanVariables_SyncRegisterSavedVariables(registeredVariables, savedVariables)
	if (registeredVariables and savedVariables) then
		-- Init registeredVariables
		for index, value in pairs(registeredVariables) do
--[[
print("_sync"
.." "..tostring(index)..""
.." : "..tostring(value)..""
)
--]]
			if (not TitanUtils_TableContainsIndex(savedVariables, index)) then
				savedVariables[index] = value;
			end
		end
					
		-- Remove out-of-date savedVariables
		for index, value in pairs(savedVariables) do
			if (not TitanUtils_TableContainsIndex(registeredVariables, index)) then
				savedVariables[index] = nil;
			end
		end
	end
end

--[[ local
NAME: Plugin_settings
DESC: Give the curent profile the default plugins - if they are registered. 
VAR: reset - boolean
OUT: None
NOTE:
- It is assumed this is a plugin wipe of the given profile.
- Use the default Titan plugin list to display on the given bar.
- These will be saved on exit or reload in the given profile.
:NOTE
--]]
local function Plugin_settings(reset)
	local plugin_list = {}
	if reset then -- use the default install list
		plugin_list = Default_Plugins
--[[
print("plugins init"
.." "..tostring(reset)..""
)
--]]
	else -- use the current profile
		plugin_list = TitanPanelSettings.Buttons
	end
	
	-- Init each and every default plugin
	for idx, default_plugin in pairs(plugin_list) do
		local id = default_plugin.id
		local loc = default_plugin.loc
		local plugin = TitanUtils_GetPlugin(id)
--TitanDebug("Plugin: "..tostring(id).." "..(plugin and "T" or "F"))
		-- See if plugin is registered
		if (plugin) then
--TitanDebug("__Plugin: "..tostring(id).." "..tostring(loc))
			-- Synchronize registered and saved variables
			TitanVariables_SyncRegisterSavedVariables(
				plugin.savedVariables, TitanPluginSettings[id])
			TitanUtils_AddButtonOnBar(loc, id)
			TitanPanelButton_UpdateButton(id)
		end
	end
end

--[[ local
NAME: TitanVariables_PluginSettingsInit
DESC: Give the curent profile the default plugins - if they are registered. 
VAR: None
OUT: None
NOTE:
- The saved variables of the given profile will be used.
- These will be saved on exit or reload in the given profile.
- The saved display list will be used but only the registered plugins will be displayed.
- The plugins that are not registered will NOT be removed from the saved list. This allows different a single saved display list to be used for toons that have different plugins enabled.
:NOTE
--]]
local function TitanVariables_PluginSettingsInit() 
	-- Loop through the user's displayed plugins and see what is
	-- actually registered
	for idx, display_plugin in pairs(TitanPanelSettings.Buttons) do
		local id = display_plugin
		local plugin = TitanUtils_GetPlugin(id)
		-- See if plugin is registered
		if (plugin) then
			-- Synchronize registered and saved variables
			TitanVariables_SyncRegisterSavedVariables(
				plugin.savedVariables, TitanPluginSettings[id])
			-- Button will be updated later
		else
			-- Do not display this plugin.
			-- Do NOT remove the button from the displayed list.
			-- This is an old 'feature' that people like...
		end
	end
end

--[[ local
NAME: TitanVariables_SyncSkins
DESC: Routine to sync two sets of skins data - Titan defaults and Titan saved vars.
VAR:  None
OUT:  None
NOTE:
- It is assumed that the list in Titan defaults or as input from the user are in the Titan skins folder. Blizz does not allow LUA to read the hard drive directly.
:NOTE
--]]
local function TitanVariables_SyncSkins()
	if (TitanSkinsDefault and TitanSkins) then
		local skins = {}
		-- insert all the Titan defaults
		for idx, v in pairs(TitanSkinsDefault) do
			table.insert (skins, TitanSkinsDefault[idx]) 
--			table.sort(skins, function(a, b)
--				return string.lower(skins[a] and skins[a].name or "") 
--					< string.lower(skins[b] and skins[b].name or "")
--			end)
		end

		-- search through the saved vars and compare against the defaults
		local found = nil
		for index, value in pairs(TitanSkins) do
			found = nil
			-- See if the skin is a default one
			for idx, v in pairs(TitanSkinsDefault) do
				if TitanSkinsDefault[idx].name == TitanSkins[index].name then
					found = idx
				end
			end
			if found then
				-- already inserted
			else -- could be user placed or old Titan
				if TitanSkins[index].titan then
					-- old Titan skin - let it drop
				else
					-- assume it is a user installed skin
					table.insert (skins, TitanSkins[index])
--					table.sort(skins, function(a, b)
--						return string.lower(skins[a] and skins[a].name or "") 
--							< string.lower(skins[b] and skins[b].name or "")
--					end)
				end
			end
		end
		return skins
	end
end

--[[ local
NAME: Set_Timers
DESC: Routine to reset / sync Titan settings.
VAR:  None
OUT:  None
--]]
local function Set_Timers(reset) 
	-- Titan is loaded so set the timers we want to use
	TitanTimers = {
		["LDBRefresh"] = {obj = "LDB", callback = TitanLDBRefreshButton, delay = 2,},
	}
	
	if reset then
		TitanAllSetVar("TimerLDB", TitanTimers["LDBRefresh"].delay)
	else
		TitanTimers["LDBRefresh"].delay = TitanAllGetVar("TimerLDB")
	end
end

--[[ Titan
NAME: TitanVariables_SyncSinglePluginSettings
DESC: Routine to sync one plugin - current loaded (lua file) to its plugin saved vars (last save to disk).
VAR:  id : plugin name
OUT:  None
--]]
function TitanVariables_SyncSinglePluginSettings(id) 
	-- Init this plugin
	local plugin = TitanPlugins[id]
	if (plugin and plugin.savedVariables) then
		-- Init savedVariables table
		if TitanPluginSettings then
			-- exists
		else
			TitanPluginSettings = {};
		end					
		if TitanPluginSettings[id] then
			-- exists
		else
			TitanPluginSettings[id] = {};
		end					
		
		-- Synchronize registered and saved variables
		TitanVariables_SyncRegisterSavedVariables(
			plugin.savedVariables, TitanPluginSettings[id]);
	end
end

--[[ Titan
NAME: TitanVariables_SyncPluginSettings
DESC: Routine to sync plugin datas - current loaded (lua file) to any plugin saved vars (last save to disk).
VAR:  None
OUT:  None
--]]
function TitanVariables_SyncPluginSettings() -- one plugin uses this
	-- Init / sync every plugin
	for id, plugin in pairs(TitanPlugins) do
		if (plugin and plugin.savedVariables) then
			TitanVariables_SyncSinglePluginSettings(id) -- sync this plugin
		else
			-- Remove plugin savedVariables table if there's one
			if (TitanPluginSettings[id]) then
				TitanPluginSettings[id] = nil;
			end								
		end
	end
end

local function Titan_SyncAdjList()
	-- Using Titan list, walk saved vars to add adjustable frames
	for frame, v in pairs(Titan_Panel.AdjList) do
		if TitanAdjustSettings[frame] then 
			-- No action needed
			-- If default adds more elements (more data), they will need to be coded here.
		else
			TitanAdjustSettings[frame] = TitanAdjDefaults -- Init the saved vars
		end
	end
	
	-- Using saved vars, walk Titan list to remove frames no longer adjustable
	for frame, v in pairs(TitanAdjustSettings) do
		if Titan_Panel.AdjList[frame] then 
			-- No action needed
			-- frame is adjustable
		else
			TitanAdjustSettings[frame] = nil -- Remove, no longer adjustable
		end
	end
end

--[[ Titan
NAME: TitanVariables_InitTitanSettings
DESC: Ensure TitanSettings (one of the saved vars in the toc) exists and set the Titan version.
VAR:  None
OUT:  None
NOTE:
- Called when Titan is loaded (ADDON_LOADED event)
:NOTE
--]]
function TitanVariables_InitTitanSettings()
	local trace = false
	local new_toon = false
	local player = TitanUtils_GetPlayer()
	if (TitanSettings) then
		-- all is good
	else
		TitanSettings = {}
		if trace then
			TitanDebug("TitanSettings {}")
		end
	end

	-- check for player list per issue #745
	if TitanSettings.Players then
		-- all is good
	else
		TitanSettings.Players = {} -- empty saved vars. New install or wipe
		if trace then
			TitanDebug("TitanSettings.Players {}")
		end
	end

	if (TitanAll) then
		-- All good
	else
		TitanAll = {}
	end
	TitanVariables_SyncRegisterSavedVariables(TITAN_ALL_SAVED_VARIABLES, TitanAll)

	-- Current Titan list known - all toons player has profiles for
	-- Sort in alphabetical order.
	-- Used for menus.
	Titan_Panel.players = {}
	for idx, v in pairs (TitanSettings.Players) do
		table.insert(Titan_Panel.players, idx)
	end
	table.sort(Titan_Panel.players, function(a, b)
		return a < b
	end)
--[===[
for idx = 1, #Titan_Panel.players do
	print("["..idx.."] : '"..Titan_Panel.players[idx].."'")
end
--]===]

	TitanSettings.Version = TITAN_VERSION;
end

--[[ Titan
NAME: TitanVariables_SetBarPos
DESC: Update local and saved vars to new bar position per user
VAR:  self - frame to save position
OUT:  None
NOTE:
- Called when Titan is loaded (ADDON_LOADED event)
- Called when user moves or changes width of bar
- :GetPoint(1) results in incorrect values based on point used
:NOTE
--]]
function TitanVariables_SetBarPos(self, reset, x_off, y_off, w_off)
	-- Collect bar x & y and save so bar stays put.
	local bar_frame = self:GetName()

	local force_reset = reset or false

	if TitanBarDataVars[bar_frame] then
		if reset then
			-- Initial defaults calc to screen size and scaling at that time - it could have changed!
			TitanBarDataVars[bar_frame].off_x = Calc_X()
			TitanBarDataVars[bar_frame].off_y = Calc_Y(TitanBarData[bar_frame].order-2)
			TitanBarDataVars[bar_frame].off_w = SHORT_WIDTH
		else
			-- local to show bars as needed
			TitanBarDataVars[bar_frame].off_x = x_off
			TitanBarDataVars[bar_frame].off_y = y_off
			TitanBarDataVars[bar_frame].off_w = w_off
		end
	end
--[[
print("_SetBarPos"
.." "..tostring(self:GetName())..""
.." "..tostring(reset)..""
.." x: "..tostring(format("%0.1f", (TitanBarDataVars[bar_frame].off_x or -1.0)))..""
.." y: "..tostring(format("%0.1f", (TitanBarDataVars[bar_frame].off_y or -1.0)))..""
.." w: "..tostring(format("%0.1f", (TitanBarDataVars[bar_frame].off_w or -1.0)))..""
)
--]]
end

--[[ Titan
NAME: TitanVariables_GetBarPos
DESC: Retrieve saved vars of bar position
VAR:  frame_str - frame name to retrieve positions from
OUT:  X, Y, Width
--]]
function TitanVariables_GetBarPos(frame_str)
	local tscale = TitanPanelGetVar("Scale")
--[[
print("_GetBarPos"
.." '"..tostring(format("%0.1f", TitanBarData[frame_str].name).."'"
.." '"..tostring(format("%0.1f", TitanBarDataVars[frame_str].off_x)).."'"
.." '"..tostring(format("%0.1f", TitanBarDataVars[frame_str].off_y)).."'"
.." '"..tostring(format("%0.1f", TitanBarDataVars[frame_str].off_w)).."'"
)
--]]
	return 
		TitanBarDataVars[frame_str].off_x, --/ tscale, -- / tscale, 
		TitanBarDataVars[frame_str].off_y, --/ tscale, -- / tscale, 
		TitanBarDataVars[frame_str].off_w -- / tscale
end

--[[ Titan
NAME: TitanVariables_GetFrameName
DESC: Build the frame name from the bar name
VAR:  bar_str - frame name to retrieve positions from
OUT:  frame string
--]]
function TitanVariables_GetFrameName(bar_str)
	return TITAN_PANEL_DISPLAY_PREFIX..bar_str
end

-- lua-users.org/wiki/CopyTable
local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local function Set_bar_vars(to_profile)
	if TitanSettings.Players[to_profile].BarVars then
		-- All good
	else
		-- Set to defaults
		TitanSettings.Players[to_profile].BarVars = TitanBarVarsDefaults
		local BV = TitanSettings.Players[to_profile].BarVars
		
		-- Cannot assume profile is current / cannot use Get Var routines.
		local panel = TitanSettings.Players[to_profile].Panel

		-- Bring original Titan bar optionss to the current user settings.
		-- If this is a new toon or new saved vars then it will just get defaults.
		for idx, v in pairs (TitanBarData) do
			if v.user_move == false then
				-- Set original Bar options from the 'old' saved vars location
				BV[idx].show = panel[v.name.."_Show"]
				BV[idx].auto_hide = panel[v.name.."_Hide"]
				BV[idx].align = panel[v.name.."_Align"]
				-- only skins before 7.x
				BV[idx].texure = Titan_Panel.SKIN
				BV[idx].skin.alpha = panel[v.name.."_Transparency"]
				BV[idx].skin.path = panel["TexturePath"]
			end
		end
	end
end

--[[ local
NAME: Init_player_settings
DESC: Use the Titan settings, the plugin settings, the 'extras' data of the given profile. Create the "to" profile if it does not exist.
VAR:  from_profile - nil or profile to switch from (string)
VAR:  to_profile - the toon to use (string)
OUT:  None
NOTE:
- Called at PLAYER_ENTERING_WORLD event after we know Titan has registered plugins.
- There are 3 actions: USE, RESET, and INIT
- USE:
 From: the user chosen profile
 To: Player or Global profile
- RESET:
 From: Titan defaults
 To: Player or Global profile
- INIT:
 From: saved variables of that profile
 To: Player or Global profile
:NOTE
--]]
local function Init_player_settings(from_profile, to_profile, action)
	local trace = false
	
	local old_player = {}
	local old_panel = {}
	local old_plugins = {}
	local reset = (action == TITAN_PROFILE_RESET)
	
	if trace then
		print("Init_player_settings"
		.." from: "..tostring(from_profile)..""
		.." to: "..tostring(to_profile)..""
		.." action: "..tostring(action)..""
		)
	end

	CleanupProfile () -- hide currently shown plugins

	if TitanSettings.Players[to_profile] then
		-- all is good
	else
		-- Create the bare player tables so profile(s) can be added
		if trace then
			TitanDebug("TitanSettings.Players[] {}")
		end
		TitanSettings.Players[to_profile] = {}
		TitanSettings.Players[to_profile].Plugins = {}
		TitanSettings.Players[to_profile].Panel = TITAN_PANEL_SAVED_VARIABLES
		TitanSettings.Players[to_profile].Panel.Buttons = {}
		TitanSettings.Players[to_profile].Panel.Location = {}
		TitanPlayerSettings = {}
		TitanPlayerSettings["Plugins"] = {}
		TitanPlayerSettings["Panel"] = {}
		TitanPlayerSettings["Register"] = {}
		TitanPlayerSettings["BarVars"] = TitanBarVarsDefaults -- New Mar 2023
		TitanPlayerSettings["Adjust"] = {} -- New May 2023
		
		new_toon = true
	end
	-- Set global variables
	TitanPlayerSettings = TitanSettings.Players[to_profile];
	TitanPluginSettings = TitanPlayerSettings["Plugins"];
	TitanPanelSettings = TitanPlayerSettings["Panel"];
	TitanVariables_SyncRegisterSavedVariables(TITAN_PANEL_SAVED_VARIABLES, TitanPanelSettings)

	-- ====== New May 2023 : Back to adjusting a couple frames per user settings
	-- Could be new toon / ...
	if TitanPlayerSettings["Adjust"] then 
		-- No action needed
	else
		TitanPlayerSettings["Adjust"] = {}
	end
	TitanAdjustSettings = TitanPlayerSettings["Adjust"]
	Titan_SyncAdjList()
	-- The player settings are known, init the adjustable frames
	for idx, v in pairs (Titan_Panel.AdjList) do
		TitanPanel_AdjustFrameInit(idx)
	end
	-- ======
	
	-- ====== New Mar 2023 : TitanSettings.Players[player].BarData to hold Short bar data
	Set_bar_vars(to_profile)
	-- ======
	if action == TITAN_PROFILE_RESET then
		-- default is global profile OFF
		TitanAll = {}
		TitanVariables_SyncRegisterSavedVariables(TITAN_ALL_SAVED_VARIABLES, TitanAll)
	elseif action == TITAN_PROFILE_INIT then
		--	
	elseif action == TITAN_PROFILE_USE then
		-- Copy from the from_profile to profile - not anything in saved vars

		if from_profile and TitanSettings.Players[from_profile] then
			old_player = TitanSettings.Players[from_profile]
			-- The requested from profile at least exists so we can copy from it
			if old_player["Panel"] then
				old_panel = old_player["Panel"]
			end
			if old_player["Plugins"] then
				old_plugins = old_player["Plugins"]
			end

			-- Ensure the old profile Bar data is whole...
			Set_bar_vars(from_profile)
			TitanSettings.Players[to_profile]["BarVars"] = deepcopy(old_player["BarVars"])

			if trace then
				-- Apply the new bar positions
				for idx, v in pairs (TitanBarData) do
					print("BarVars "
					.." "..tostring(v.name)..""
					.." "..tostring(TitanSettings.Players[from_profile]["BarVars"][idx].show)..""
					.." "..tostring(TitanSettings.Players[to_profile]["BarVars"][idx].show)..""
					)
				end
			end

			-- Copy the panel settings
			for index, id in pairs(old_panel) do
				TitanPanelSetVar(index, old_panel[index]);		
			end

			-- Copy the plugin settings
			for plugin, i in pairs(old_plugins) do
				for var, id in pairs(old_plugins[plugin]) do		
					TitanSetVar(plugin, var, old_plugins[plugin][var])
				end
			end
		end
	end

	TitanBarDataVars = TitanPlayerSettings["BarVars"] -- works here, after setting BarVars

	if (TitanPlayerSettings) then
		-- Synchronize plugin settings with plugins that were registered
		TitanVariables_SyncPluginSettings()
		-- Display the plugins the user selected AND are registered
		if reset then
			Plugin_settings(reset)
		else
			TitanVariables_PluginSettingsInit()
		end
	end
	
	TitanSkins = TitanVariables_SyncSkins()

	Set_Timers(reset)
	
	-- for debug if a user needs to send in the Titan saved vars
	if TitanPlayerSettings["Register"] then
		-- From WoW saved vars
	else
		-- New install or after reset
		TitanPlayerSettings["Register"] = {}
	end
	TitanPanelRegister = TitanPlayerSettings["Register"]
	
	TitanSettings.Profile = to_profile
end

--[[ API
NAME: TitanGetVar
DESC: Get the value of the requested plugin variable.
VAR: id - the plugin name (string)
VAR: var - the name (string) of the variable
OUT:  None
NOTE:
- 'var' is from the plugin <button>.registry.savedVariables table as created in the plugin lua.
:NOTE
--]]
function TitanGetVar(id, var)
	if (id and var and TitanPluginSettings and TitanPluginSettings[id]) then
		-- compatibility check
		if TitanPluginSettings[id][var] == "Titan Nil" then 
			TitanPluginSettings[id][var] = false 
		end
		return TitanPluginSettings[id][var];
		--return TitanUtils_Ternary(TitanPluginSettings[id][var] == false, nil, TitanPluginSettings[id][var]);
	end
end

--[[ API
NAME: TitanVarExists
DESC: Determine if requested plugin variable exists.
VAR: id - the plugin name (string)
VAR: var - the name (string) of the variable
OUT:  None
NOTE:
- 'var' is from the plugin <button>.registry.savedVariables table as created in the plugin lua.
- This checks existence NOT false!
:NOTE
--]]
function TitanVarExists(id, var)
	-- We need to check for existance not true!
	-- If the value is nil then it will not exist...
	if (id and var and TitanPluginSettings and TitanPluginSettings[id] 
	and (TitanPluginSettings[id][var] 
		or TitanPluginSettings[id][var] == false) )
	then
		return true
	else
		return false
	end
end

--[[ API
NAME: TitanSetVar
DESC: Get the value of the requested plugin variable to the given value.
VAR: id - the plugin name (string)
VAR: var - the name (string) of the variable
VAR: value - new value of var
OUT:  None
NOTE:
- 'var' is from the plugin <button>.registry.savedVariables table as created in the plugin lua.
:NOTE
--]]
function TitanSetVar(id, var, value)
	if (id and var and TitanPluginSettings and TitanPluginSettings[id]) then
		TitanPluginSettings[id][var] = TitanUtils_Ternary(value, value, false);
	end
end

--[[ API
NAME: TitanToggleVar
DESC: Toggle the value of the requested plugin variable. This assumes var value represents a boolean
VAR: id - the plugin name (string)
VAR: var - the name (string) of the variable
OUT:  None
NOTE:
- Boolean in this case could be true / false or non zero / zero or nil.
:NOTE
--]]
function TitanToggleVar(id, var)
	if (id and var and TitanPluginSettings and TitanPluginSettings[id]) then
		TitanSetVar(id, var, TitanUtils_Toggle(TitanGetVar(id, var)));
	end
end

--[[ API
NAME: TitanPanelGetVar
DESC: Get the value of the requested Titan variable.
VAR: var - the name (string) of the variable
OUT: value of the requested Titan variable
NOTE:
- 'var' is from the TitanPanelSettings[var].
:NOTE
--]]
function TitanPanelGetVar(var)
	if (var and TitanPanelSettings) then
		if TitanPanelSettings[var] == "Titan Nil" then 
			TitanPanelSettings[var] = false 
		end		
		return TitanUtils_Ternary(TitanPanelSettings[var] == false, nil, TitanPanelSettings[var]);
	end
end

--[[ API
NAME: TitanPanelSetVar
DESC: Set the value of the requested Titan variable.
VAR: var - the name (string) of the variable
VAR: value - new value of var
OUT:  None
NOTE:
- 'var' is from the TitanPanelSettings[var].
:NOTE
--]]
function TitanPanelSetVar(var, value)
	if (var and TitanPanelSettings) then		
		TitanPanelSettings[var] = TitanUtils_Ternary(value, value, false);
	end
end

--[[ API
NAME: TitanPanelToggleVar
DESC: Toggle the value of the requested Titan variable. This assumes var value represents a boolean
VAR:  var - the name (string) of the variable
OUT:  None
NOTE:
- Boolean in this case could be true / false or non zero / zero or nil.
:NOTE
--]]
function TitanPanelToggleVar(var)
	if (var and TitanPanelSettings) then
		TitanPanelSetVar(var, TitanUtils_Toggle(TitanPanelGetVar(var)));
	end
end

--[[ API
NAME: TitanAllGetVar
DESC: Get the value of the requested Titan global variable.
VAR: var - the name (string) of the variable
OUT: None
NOTE:
- 'var' is from the TitanAll[var].
:NOTE
--]]
function TitanAllGetVar(var)
	if (var and TitanAll) then
		if TitanAll[var] == "Titan Nil" then 
			TitanAll[var] = false 
		end
		return TitanUtils_Ternary(TitanAll[var] == false, nil, TitanAll[var]);
	end
end

--[[ API
NAME: TitanAllSetVar
DESC: Set the value of the requested Titan global variable.
VAR: var - the name (string) of the variable
VAR: value - new value of var
OUT:  None
NOTE:
- 'var' is from the TitanPanelSettings[var].
:NOTE
--]]
function TitanAllSetVar(var, value)
	if (var and TitanAll) then
		TitanAll[var] = TitanUtils_Ternary(value, value, false);
	end
end

--[[ API
NAME: TitanAllToggleVar
DESC: Toggle the value of the requested Titan global variable. This assumes var value represents a boolean
VAR: var - the name (string) of the variable
OUT: None
NOTE:
- Boolean in this case could be true / false or non zero / zero or nil.
:NOTE
--]]
function TitanAllToggleVar(var)
	if (var and TitanAll) then
		TitanAllSetVar(var, TitanUtils_Toggle(TitanAllGetVar(var)));
	end
end

--[[ API
NAME: TitanVariables_GetPanelStrata
DESC: Return the strata and the next highest strata of the given value
VAR: value - the name (string) of the strata to look up
OUT: string - Next highest strata
OUT: string - passed in strata
--]]
function TitanVariables_GetPanelStrata(value)
	-- obligatory check
	if not value then value = "DIALOG" end

	local index;
	local indexpos = 5 -- DIALOG
	local StrataTypes = {"BACKGROUND", "LOW", "MEDIUM", "HIGH", 
		"DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG"}

	for index in ipairs(StrataTypes) do
		if value == StrataTypes[index] then
			indexpos = index
			break
		end
	end
	
	return StrataTypes[indexpos + 1], StrataTypes[indexpos]
end

--[[ API
NAME: TitanVariables_SetPanelStrata
DESC: Set the Titan bars to the given strata and the plugins to the next highest strata.
VAR: value - strata name (string)
OUT: None
--]]
function TitanVariables_SetPanelStrata(value)
	local plugins, bars = TitanVariables_GetPanelStrata(value)
	local idx, v
	-- Set all the Titan bars
	for idx,v in pairs (TitanBarData) do
		_G[idx]:SetFrameStrata(bars)
	end
	-- Set all the registered plugins
	for idx, v in pairs(TitanPluginsIndex) do
		local button = TitanUtils_GetButton(v);
		button:SetFrameStrata(plugins)
	end
end

--[[ Titan
NAME: TitanVariables_UseSettings
DESC: Set the Titan variables and plugin variables to the passed in profile.
VAR: profile - profile to use for this toon : <name>@<server>
OUT: None
NOTE:
- Called from the Titan right click menu
- profile is compared as 'lower' so the case of profile does not matter 
:NOTE
--]]
function TitanVariables_UseSettings(profile, action)
--[[
print("_UseSettings "
.."profile: "..(profile or "?").." "
.."action: "..action.." "
)
--]]

	local from_profile = nil
	if action == TITAN_PROFILE_USE then
		-- Grab the old profile currently in use
		from_profile = profile or nil
	end
	
	local _ = nil
	local glob, name, player, server = TitanUtils_GetGlobalProfile()
	-- Get the profile according to the user settings
	if glob then
		profile = name -- Use global toon
	else
		profile, _, _ = TitanUtils_GetPlayer() -- Use current toon
	end

	-- Find the profile in a case insensitive manner
	local new_profile = ""
	profile = string.lower(profile)
	for index, id in pairs(TitanSettings.Players) do
		if profile == string.lower(index) then
			new_profile = index
		end
	end
	if new_profile == "" then
		-- Assume we need the current player
		new_profile = TitanUtils_GetPlayer() --TitanSettings.Player
		-- And it needs to be created
		action = TITAN_PROFILE_RESET
	end
	
	-- Now that we know what profile to use - act on the data
	Init_player_settings(from_profile, new_profile, action)
	
	-- set strata in case it has changed
	TitanVariables_SetPanelStrata(TitanPanelGetVar("FrameStrata"))

	-- show the new profile
	TitanPanel_InitPanelBarButton();
	TitanPanel_InitPanelButtons();
end

-- decrecated routines
--[[

function TitanGetVarTable(id, var, position)
	if (id and var and TitanPluginSettings and TitanPluginSettings[id]) then
		-- compatibility check
		if TitanPluginSettings[id][var][position] == "Titan Nil" then TitanPluginSettings[id][var][position] = false end
		return TitanUtils_Ternary(TitanPluginSettings[id][var][position] == false, nil, TitanPluginSettings[id][var][position]);
	end
end

function TitanSetVarTable(id, var, position, value)
	if (id and var and TitanPluginSettings and TitanPluginSettings[id]) then
		TitanPluginSettings[id][var][position] = TitanUtils_Ternary(value, value, false);
	end
end

--]]