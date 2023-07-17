--[[ File
NAME: TitanGlobal.lua
DESC: This file contains the global variables and constants used throughout Titan.
:DESC
--]]

-- Global variables 
TITAN_ID = "Titan"

Titan_Panel = {} -- begin the slow journey to a smaller _G footprint


TITAN_DEBUG_ARRAY_MAX = 100
TITAN_PANEL_NONMOVABLE_PLUGINS = {};
TITAN_PANEL_MENU_FUNC_HIDE = "TitanPanelRightClickMenu_Hide";
TitanPlugins = {};  -- Used by plugins
TitanPluginsIndex = {};
TITAN_NOT_REGISTERED = _G["RED_FONT_COLOR_CODE"].."Not_Registered_Yet".._G["FONT_COLOR_CODE_CLOSE"]
TITAN_REGISTERED = _G["GREEN_FONT_COLOR_CODE"].."Registered".._G["FONT_COLOR_CODE_CLOSE"]
TITAN_REGISTER_FAILED = _G["RED_FONT_COLOR_CODE"].."Failed_to_Register".._G["FONT_COLOR_CODE_CLOSE"]

Titan__InitializedPEW = nil
Titan__Initialized_Settings = nil

TITAN_AT = "@"

TitanAll = nil;
TitanSettings = nil;
TitanPlayerSettings = nil
TitanPluginSettings = nil;  -- Used by plugins
TitanPanelSettings = nil;

TITAN_PANEL_UPDATE_BUTTON = 1;
TITAN_PANEL_UPDATE_TOOLTIP = 2;
TITAN_PANEL_UPDATE_ALL = 3;
TitanTooltipOrigScale = 1;
TitanTooltipScaleSet = 0;

-- Set Titan Version var for backwards compatibility
TITAN_VERSION = GetAddOnMetadata(TITAN_ID, "Version") or L["TITAN_NA"]

-- Various constants
TITAN_PANEL_PLACE_TOP = 1;
TITAN_PANEL_PLACE_BOTTOM = 2;
TITAN_PANEL_PLACE_BOTH = 3;
TITAN_PANEL_MOVING = 0;

TITAN_WOW_SCREEN_TOP = 768
TITAN_WOW_SCREEN_BOT = 0

TITAN_TOP = "Top"
TITAN_BOTTOM = "Bottom"
TITAN_SHORT = "Short"

TITAN_RIGHT = "Right"
TITAN_LEFT = "Left"
TITAN_PANEL_BUTTONS_ALIGN_LEFT = 1;
TITAN_PANEL_BUTTONS_ALIGN_CENTER = 2;

-- Titan plugins are in the form of TitanPanel<id>Button
Titan_Panel.plugin = {}
Titan_Panel.plugin.PRE = "TitanPanel"
Titan_Panel.plugin.POST = "Button"


TITAN_PANEL_CONTROL = "TitanPanelBarButton"
-- New bar vars
TITAN_PANEL_BAR_HEIGHT = 24
TITAN_PANEL_BAR_TEXTURE_HEIGHT = 30
TITAN_PANEL_AUTOHIDE_PREFIX = "TitanPanelAutoHide_"
TITAN_PANEL_AUTOHIDE_SUFFIX = "Button"
TITAN_PANEL_HIDE_PREFIX = "Titan_Bar__Hider_"
TITAN_PANEL_DISPLAY_PREFIX = "Titan_Bar__Display_"
TITAN_PANEL_DISPLAY_MENU = "Menu_"
TITAN_PANEL_BACKGROUND_PREFIX = "TitanPanelBackground_"
TITAN_PANEL_CLICK_MENU_SUFFIX = "RightClickMenu"
TITAN_PANEL_TEXT = "Text"
TITAN_PANEL_TEXTURE_VAR = "Texture"
TITAN_PANEL_BUTTON_TEXT = "Button"..TITAN_PANEL_TEXT
TITAN_PANEL_CONSTANTS = {
	FONT_SIZE = 10,
	FONT_NAME = "Friz Quadrata TT"
}

TITAN_CUSTOM_PROFILE_POSTFIX = "TitanCustomProfile"
TITAN_PROFILE_NONE = "<>"
TITAN_PROFILE_RESET = "<RESET>"
TITAN_PROFILE_USE = "<USE>"
TITAN_PROFILE_INIT = "<INIT>"

AUTOHIDE_PREFIX = "TitanPanelAutoHide_"
AUTOHIDE_SUFFIX = "Button"

TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY = 
	{"Built-ins","General","Combat","Information","Interface","Profession"}

-- Bar background types
Titan_Panel.SKIN = "skin"
Titan_Panel.COLOR = "color"
Titan_Panel.NONE = "none"

-- For debug across Titan Panel
Titan_Panel.debug = {}
Titan_Panel.debug.movable = false
Titan_Panel.debug.events = false
Titan_Panel.debug.ldb_setup = false
Titan_Panel.debug.tool_tips = false
Titan_Panel.debug.plugin_register = false
Titan_Panel.debug.plugin_register_deep = false

