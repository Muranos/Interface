local E, L, C = select(2, ...):unpack()

local L_PVP_TRINKET = GetSpellInfo(283167)
local RACIAL_TRAITS = gsub(RACIAL_TRAITS, ":", "")

E.BASE_ICON_SIZE = 36

E.CRF_KGT = {
	"CompactRaidGroup1Member1","CompactRaidGroup1Member2","CompactRaidGroup1Member3","CompactRaidGroup1Member4","CompactRaidGroup1Member5",
	"CompactRaidGroup2Member1","CompactRaidGroup2Member2","CompactRaidGroup2Member3","CompactRaidGroup2Member4","CompactRaidGroup2Member5",
	"CompactRaidGroup3Member1","CompactRaidGroup3Member2","CompactRaidGroup3Member3","CompactRaidGroup3Member4","CompactRaidGroup3Member5",
	"CompactRaidGroup4Member1","CompactRaidGroup4Member2","CompactRaidGroup4Member3","CompactRaidGroup4Member4","CompactRaidGroup4Member5",
	"CompactRaidGroup5Member1","CompactRaidGroup5Member2","CompactRaidGroup5Member3","CompactRaidGroup5Member4","CompactRaidGroup5Member5",
	"CompactRaidGroup6Member1","CompactRaidGroup6Member2","CompactRaidGroup6Member3","CompactRaidGroup6Member4","CompactRaidGroup6Member5",
	"CompactRaidGroup7Member1","CompactRaidGroup7Member2","CompactRaidGroup7Member3","CompactRaidGroup7Member4","CompactRaidGroup7Member5",
	"CompactRaidGroup8Member1","CompactRaidGroup8Member2","CompactRaidGroup8Member3","CompactRaidGroup8Member4","CompactRaidGroup8Member5",
}

E.CRF_RAID = {
	"CompactRaidFrame1","CompactRaidFrame2","CompactRaidFrame3","CompactRaidFrame4","CompactRaidFrame5",
	"CompactRaidFrame6","CompactRaidFrame7","CompactRaidFrame8","CompactRaidFrame9","CompactRaidFrame10",
	"CompactRaidFrame11","CompactRaidFrame12","CompactRaidFrame13","CompactRaidFrame14","CompactRaidFrame15",
	"CompactRaidFrame16","CompactRaidFrame17","CompactRaidFrame18","CompactRaidFrame19","CompactRaidFrame20",
	"CompactRaidFrame21","CompactRaidFrame22","CompactRaidFrame23","CompactRaidFrame24","CompactRaidFrame25",
	"CompactRaidFrame26","CompactRaidFrame27","CompactRaidFrame28","CompactRaidFrame29","CompactRaidFrame30",
	"CompactRaidFrame31","CompactRaidFrame32","CompactRaidFrame33","CompactRaidFrame34","CompactRaidFrame35",
	"CompactRaidFrame36","CompactRaidFrame37","CompactRaidFrame38","CompactRaidFrame39","CompactRaidFrame40",
	"CompactRaidFrame41","CompactRaidFrame42","CompactRaidFrame43","CompactRaidFrame44","CompactRaidFrame45",
	"CompactRaidFrame46","CompactRaidFrame47","CompactRaidFrame48","CompactRaidFrame49","CompactRaidFrame50",
}

E.CRF_PARTY = {
	"CompactPartyFrameMember1",
	"CompactPartyFrameMember2",
	"CompactPartyFrameMember3",
	"CompactPartyFrameMember4",
	"CompactPartyFrameMember5",
}

E.RAID_UNIT = {
	"raid1","raid2","raid3","raid4","raid5","raid6","raid7","raid8","raid9","raid10",
	"raid11","raid12","raid13","raid14","raid15","raid16","raid17","raid18","raid19","raid20",
	"raid21","raid22","raid23","raid24","raid25","raid26","raid27","raid28","raid29","raid30",
	"raid31","raid32","raid33","raid34","raid35","raid36","raid37","raid38","raid39","raid40",
}

E.RAID_INDEX = {
	["raid1"]=1,["raid2"]=2,["raid3"]=3,["raid4"]=4,["raid5"]=5,
	["raid6"]=6,["raid7"]=7,["raid8"]=8,["raid9"]=9,["raid10"]=10,
	["raid11"]=11,["raid12"]=12,["raid13"]=13,["raid14"]=14,["raid15"]=15,
	["raid16"]=16,["raid17"]=17,["raid18"]=18,["raid19"]=19,["raid20"]=20,
	["raid21"]=21,["raid22"]=22,["raid23"]=23,["raid24"]=24,["raid25"]=25,
	["raid26"]=26,["raid27"]=27,["raid28"]=28,["raid29"]=29,["raid30"]=30,
	["raid31"]=31,["raid32"]=32,["raid33"]=33,["raid34"]=34,["raid35"]=35,
	["raid36"]=36,["raid37"]=37,["raid38"]=38,["raid39"]=39,["raid40"]=40,
}

E.RAID_PET_INDEX = {
	["raid1"]=1,["raid2"]=2,["raid3"]=3,["raid4"]=4,["raid5"]=5,
	["raid6"]=6,["raid7"]=7,["raid8"]=8,["raid9"]=9,["raid10"]=10,
	["raid11"]=11,["raid12"]=12,["raid13"]=13,["raid14"]=14,["raid15"]=15,
	["raid16"]=16,["raid17"]=17,["raid18"]=18,["raid19"]=19,["raid20"]=20,
	["raid21"]=21,["raid22"]=22,["raid23"]=23,["raid24"]=24,["raid25"]=25,
	["raid26"]=26,["raid27"]=27,["raid28"]=28,["raid29"]=29,["raid30"]=30,
	["raid31"]=31,["raid32"]=32,["raid33"]=33,["raid34"]=34,["raid35"]=35,
	["raid36"]=36,["raid37"]=37,["raid38"]=38,["raid39"]=39,["raid40"]=40,
	["raidpet1"]=1,["raidpet2"]=2,["raidpet3"]=3,["raidpet4"]=4,["raidpet5"]=5,
	["raidpet6"]=6,["raidpet7"]=7,["raidpet8"]=8,["raidpet9"]=9,["raidpet10"]=10,
	["raidpet11"]=11,["raidpet12"]=12,["raidpet13"]=13,["raidpet14"]=14,["raidpet15"]=15,
	["raidpet16"]=16,["raidpet17"]=17,["raidpet18"]=18,["raidpet19"]=19,["raidpet20"]=20,
	["raidpet21"]=21,["raidpet22"]=22,["raidpet23"]=23,["raidpet24"]=24,["raidpet25"]=25,
	["raidpet26"]=26,["raidpet27"]=27,["raidpet28"]=28,["raidpet29"]=29,["raidpet30"]=30,
	["raidpet31"]=31,["raidpet32"]=32,["raidpet33"]=33,["raidpet34"]=34,["raidpet35"]=35,
	["raidpet36"]=36,["raidpet37"]=37,["raidpet38"]=38,["raidpet39"]=39,["raidpet40"]=40,
}

E.PARTY_UNIT = {
	"party1","party2","party3","party4","player",
}

E.PARTY_INDEX = {
	["party1"]=1,["party2"]=2,["party3"]=3,["party4"]=4,["player"]=5,
}

E.PARTY_PET_INDEX = {
	["party1"]=1,["party2"]=2,["party3"]=3,["party4"]=4,["player"]=5,
	["partypet1"]=1,["partypet2"]=2,["partypet3"]=3,["partypet4"]=4,["pet"]=5,
}

E.CFG_GROUP_TYPE = {
	["arena"] = {
		[1] = DEFAULT, --COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE3PLAYERS
		[2] = 1,
		[3] = L["Group Size"] .. ": 1 - 3",
	},
	["party"] = {
		[1] = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE5PLAYERS,
		[2] = 2,
		[3] = L["Group Size"] .. ": 4 - 5",
	},
	["raid"] = {
		[1] = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE40PLAYERS,
		[2] = 3,
		[3] = L["Group Size"] .. ": 6 - 40",
	},
	["manual"] = {
		[1] = TRACKER_SORT_MANUAL,
		[2] = 4,
		[3] = "",
	}
}

E.L_PRESETS = {
	["TOPLEFT"] = L["LEFT"],
	["TOPRIGHT"] = L["RIGHT"],
	["manual"] = LFG_LIST_MORE,
}

E.L_POINTS = {
	["LEFT"] = L["LEFT"],
	["RIGHT"] = L["RIGHT"],
	["TOPRIGHT"] = L["TOPRIGHT"],
	["TOPLEFT"] = L["TOPLEFT"],
	["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
	["BOTTOMLEFT"] = L["BOTTOMLEFT"],
}

E.L_LAYOUT = {
	["horizontal"] = L["Vertical Groups"],
	["vertical"] = COMPACT_UNIT_FRAME_PROFILE_HORIZONTALGROUPS,
	["doubleRow"] = L["Use Double Row"],
}

E.L_GLOW_ATLAS ={
	["bags-glow-white"] = ICON_TAG_RAID_TARGET_SKULL3,
	["bags-glow-green"] = ICON_TAG_RAID_TARGET_TRIANGLE3,
	["bags-glow-blue"] = ICON_TAG_RAID_TARGET_SQUARE3,
	["bags-glow-purple"] = ICON_TAG_RAID_TARGET_DIAMOND3,
	["bags-glow-orange"] = ICON_TAG_RAID_TARGET_CIRCLE3,
	["bags-glow-artifact"] = ICON_TAG_RAID_TARGET_STAR3,
}

E.L_ALIGN = {
	["CENTER"] = L["CENTER"],
	["TOPLEFT"] = L["LEFT"],
	["TOPRIGHT"] = L["RIGHT"],
}

E.L_ZONE = {
	["arena"] = ARENA,
	["pvp"] = BATTLEGROUNDS,
	["party"] = DUNGEONS,
	["raid"] = RAIDS,
	["scenario"] = SCENARIOS,
	["none"] = BUG_CATEGORY2,
}

E.L_PRIORITY = {
	["interrupt"] = L["Interrupts"],
	["cc"] = L["Crowd Control"],
	["immunity"] = L["Immunity"],
	["defensive"] = L["Defensive"],
	["offensive"] = L["Offensive"],
	["others"] = OTHER,
	["custom"] = CUSTOM,
	["all"] = ALL_CLASSES,
	["trinket"] = L_PVP_TRINKET,
	["racial"] = RACIAL_TRAITS,
	["essence"] = AZERITE_ESSENCE_ITEM_TYPE,
}

E.L_SPELL_TYPE = {
	["interrupt"] = L["Interrupts"], -- INTERRUPTS
	["cc"] = L["Crowd Control"],
	["immunity"] = L["Immunity"],
	["defensive"] = L["Defensive"],
	["offensive"] = L["Offensive"],
	["others"] = OTHER,
	["custom"] = CUSTOM,
}

E.L_HIGHLIGHTS = {
	["immunity"] = L["Immunity"],
	["defensive"] = L["Defensive"],
	["offensive"] = L["Offensive"],
	["others"] = OTHER,
}

E.BOOKTYPE_SPELLS = { -- [34]
	-- Hotfixed July 27, 2020
	--[[
	[208683] = true,
	[195710] = true,
	]]
	["interrupt"] = true,
	["cc"] = true,
	["immunity"] = true,
	["defensive"] = true,
	["offensive"] = true,
	["others"] = true,
	["custom"] = true,
}

E.OTHER_SORT_ORDER = {
	"ALL",
	"RACIAL",
	"TRINKET",
	"ESSENCES"
}

E.L_CATAGORY_OTHER = {
	["ALL"] = ALL_CLASSES,
	["RACIAL"] = RACIAL_TRAITS,
	["TRINKET"] = L_PVP_TRINKET,
	["ESSENCES"] = AZERITE_ESSENCE_ITEM_TYPE,
}

E.ICO = {
	["CLASS"] = "Interface\\Icons\\classicon_",
	["ALL"] = "Interface\\Icons\\inv_60pvp_trinket2d",
	["RACIAL"] = "Interface\\Icons\\Achievement_character_human_female",
	["TRINKET"] = "Interface\\Icons\\ability_pvp_gladiatormedallion",
	["ESSENCES"] = "Interface\\Icons\\inv_heartofazeroth",
}

E.STR = {
	["RELOAD_UI"] = L["Reload UI?"],
	["BLIZZARD_CRF_DISABLED"] = L["Blizzard Raid Frames has been disabled by your AddOn(s). Enable and reload UI?"],
	-- TODO: L
	--["UNSUPPORTED_ADDON"] = L["Test Mode Disabled: Non-Blizzard party frames"],
	["UNSUPPORTED_ADDON"] = "Test function is disabled for %s. Configure OmniCD while in a group.",
	["PIXEL_ON"] = L["Pixel Perfect ON."],
	["ICO_SCALE_CHANGED"] = L["Icon Scale Changed."],
	["UI_SCALE_CHANGED"] = L["UI Scale Changed."],
	["MAX_RANGE"] = MAXIMUM .. ": 999",
}

E.TEXTURES = {
	White8x8 = [[Interface\BUTTONS\White8x8]],
}

E.backdrop = {
	bgFile = E.TEXTURES.White8x8,
	edgeFile = E.TEXTURES.White8x8,
	edgeSize = E.NumPixels,
}

E.INVSLOT_INDEX = {
	13, --INVSLOT_TRINKET1
	14, --INVSLOT_TRINKET2
	2,  --INVSLOT_NECK
	1,  --INVSLOT_HEAD
	3,  --INVSLOT_SHOULDER
	5,  --INVSLOT_CHEST
}

E.INVSLOTS = {
	[13] = true,
	[14] = true,
	[2] = true,
	[1] = true,
	[3] = true,
	[5] = true,
}

E.POWER_TYPE_SPEC = {
	[250] = 1,
	[253] = 1,
	[254] = 1,
	[255] = 1,
	[269] = true,
	[70] = true,
	[260] = true,
	[261] = true,
	[71] = 1,
	[72] = 1,
	[73] = 1,
}

E.POWER_TYPE_IDS = {
	--["RUNES"] = 5, -- [3]
	["RUNIC_POWER"] = 6,
	["FOCUS"] = 2,
	["CHI"] = 12,
	["HOLY_POWER"] = 9,
	["RAGE"] = 1,
	["COMBO_POINTS"] = 4,
}
