-- Definition of buff impact types
VUHDO_BUFF_TARGET_SELF = 1;
VUHDO_BUFF_TARGET_SINGLE = 2;
VUHDO_BUFF_TARGET_UNIQUE = 3;
VUHDO_BUFF_TARGET_OWN_GROUP = 4;
VUHDO_BUFF_TARGET_TOTEM = 7;
VUHDO_BUFF_TARGET_STANCE = 8;
VUHDO_BUFF_TARGET_HOSTILE = 9;
VUHDO_BUFF_TARGET_RAID = 10;
VUHDO_BUFF_TARGET_ENCHANT = 11;
VUHDO_BUFF_TARGET_ENCHANT_OFF = 12;



--
VUHDO_GROUPS_BUFFS = {
	[VUHDO_BUFF_TARGET_OWN_GROUP] = true,
	[VUHDO_BUFF_TARGET_TOTEM] = true,
	[VUHDO_BUFF_TARGET_RAID] = true,
};



local GROUP_ATK_POWER = {
	VUHDO_SPELL_ID.BUFF_BATTLE_SHOUT,
};

--[[local GROUP_ATK_SPEED = {
 ]] -- not needed yet

local GROUP_HASTE = { };

local GROUP_CRIT = { };

local GROUP_MASTERY = { };

local GROUP_STATS = { };

local GROUP_SPELL_POWER = {
	VUHDO_SPELL_ID.BUFF_ARCANE_BRILLIANCE,
};

local GROUP_STAM = {
	VUHDO_SPELL_ID.BUFF_POWER_WORD_FORTITUDE,
};



--
-- Buffs per Class
-- Class => BUff-disjunctive-Group => Buff-Overwriting-Group => BuffName, Target type
--
VUHDO_CLASS_BUFFS = {
	-- Priest
	["PRIEST"] = {
		[VUHDO_SPELL_ID.BUFF_POWER_WORD_FORTITUDE] = {
			{ VUHDO_SPELL_ID.BUFF_POWER_WORD_FORTITUDE, VUHDO_BUFF_TARGET_RAID, GROUP_STAM },
		},
		[VUHDO_SPELL_ID.BUFF_SHADOWFIEND] = {
			{ VUHDO_SPELL_ID.BUFF_SHADOWFIEND, VUHDO_BUFF_TARGET_HOSTILE },
		},
		[VUHDO_SPELL_ID.BUFF_POWER_INFUSION] = {
			{ VUHDO_SPELL_ID.BUFF_POWER_INFUSION, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_SPELL_ID.BUFF_VAMPIRIC_EMBRACE] = {
			{ VUHDO_SPELL_ID.BUFF_VAMPIRIC_EMBRACE, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_LEVITATE] = {
			{ VUHDO_SPELL_ID.BUFF_LEVITATE, VUHDO_BUFF_TARGET_SINGLE },
		},
		[VUHDO_SPELL_ID.PAIN_SUPPRESSION] = {
			{ VUHDO_SPELL_ID.PAIN_SUPPRESSION, VUHDO_BUFF_TARGET_UNIQUE },
		},
	},

	-- Shaman
	["SHAMAN"] = {
		[VUHDO_SPELL_ID.BUFF_FIRE_ELEMENTAL_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_FIRE_ELEMENTAL_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_MAGMA_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_MAGMA_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_GROUNDING_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_GROUNDING_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_CAPACITOR_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_CAPACITOR_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_SPIRIT_LINK_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_SPIRIT_LINK_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_WINDWALK_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_WINDWALK_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_EARTHBIND_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_EARTHBIND_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_EARTH_ELEMENTAL_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_EARTH_ELEMENTAL_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_EARTHGRAB_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_EARTHGRAB_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_TREMOR_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_TREMOR_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_HEALING_STREAM_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_HEALING_STREAM_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_HEALING_TIDE_TOTEM] = {
			{ VUHDO_SPELL_ID.BUFF_HEALING_TIDE_TOTEM, VUHDO_BUFF_TARGET_TOTEM },
		},
		[VUHDO_SPELL_ID.BUFF_HEROISM] = {
			{ VUHDO_SPELL_ID.BUFF_HEROISM, VUHDO_BUFF_TARGET_RAID },
		},
		[VUHDO_SPELL_ID.BUFF_BLOODLUST] = {
			{ VUHDO_SPELL_ID.BUFF_BLOODLUST, VUHDO_BUFF_TARGET_RAID },
		},
		[VUHDO_SPELL_ID.BUFF_EARTH_SHIELD] ={
			{ VUHDO_SPELL_ID.BUFF_EARTH_SHIELD, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_SPELL_ID.BUFF_LIGHTNING_SHIELD] = {
			{ VUHDO_SPELL_ID.BUFF_LIGHTNING_SHIELD, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_WATER_SHIELD] = {
			{ VUHDO_SPELL_ID.BUFF_WATER_SHIELD, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_I18N_BUFFC_WEAPON_ENCHANT] = {
			{ VUHDO_SPELL_ID.WINDFURY_WEAPON, VUHDO_BUFF_TARGET_ENCHANT },
			{ VUHDO_SPELL_ID.FLAMETONGUE_WEAPON, VUHDO_BUFF_TARGET_ENCHANT },
		},
		[VUHDO_I18N_BUFFC_WEAPON_ENCHANT_OFF] = {
			{ VUHDO_SPELL_ID.FLAMETONGUE_WEAPON, VUHDO_BUFF_TARGET_ENCHANT_OFF },
		},
	},

	["PALADIN"] = {
		[VUHDO_SPELL_ID.BUFF_BEACON_OF_FAITH] = {
			{ VUHDO_SPELL_ID.BUFF_BEACON_OF_FAITH, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_SPELL_ID.BUFF_BEACON_OF_LIGHT] = {
			{ VUHDO_SPELL_ID.BUFF_BEACON_OF_LIGHT, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_SPELL_ID.BUFF_GREATER_BLESSING_OF_KINGS] = {
			{ VUHDO_SPELL_ID.BUFF_GREATER_BLESSING_OF_KINGS, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_SPELL_ID.BUFF_GREATER_BLESSING_OF_WISDOM] = {
			{ VUHDO_SPELL_ID.BUFF_GREATER_BLESSING_OF_WISDOM, VUHDO_BUFF_TARGET_UNIQUE },
		},		
	},

	["DRUID"] = { 
		-- TODO: what would be useful for Druids?
	},

	["WARLOCK"] = {
		[VUHDO_SPELL_ID.BUFF_GRIMOIRE_OF_SACRIFICE] = {
			{ VUHDO_SPELL_ID.BUFF_GRIMOIRE_OF_SACRIFICE, VUHDO_BUFF_TARGET_SELF },
		},
	},

	["MAGE"] = {
		[VUHDO_SPELL_ID.BUFF_ARCANE_BRILLIANCE] = {
			{ VUHDO_SPELL_ID.BUFF_ARCANE_BRILLIANCE, VUHDO_BUFF_TARGET_RAID, GROUP_SPELL_POWER },
		},
		[VUHDO_SPELL_ID.BUFF_ICE_BLOCK] = {
			{ VUHDO_SPELL_ID.BUFF_ICE_BLOCK, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_COMBUSTION] = {
			{ VUHDO_SPELL_ID.BUFF_COMBUSTION, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_SLOW_FALL] = {
			{ VUHDO_SPELL_ID.BUFF_SLOW_FALL, VUHDO_BUFF_TARGET_SINGLE },
		},
		[VUHDO_SPELL_ID.BUFF_INVISIBILITY] = {
			{ VUHDO_SPELL_ID.BUFF_INVISIBILITY, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.ICE_BARRIER] = {
			{ VUHDO_SPELL_ID.ICE_BARRIER, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.RUNE_OF_POWER] = {
			{ VUHDO_SPELL_ID.RUNE_OF_POWER, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.TEMPORAL_SHIELD] = {
			{ VUHDO_SPELL_ID.TEMPORAL_SHIELD, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_ARCANE_FAMILIAR] = {
			{ VUHDO_SPELL_ID.BUFF_ARCANE_FAMILIAR, VUHDO_BUFF_TARGET_SELF },
		},
	},

	["DEATHKNIGHT"] = {
		-- TODO: what would be useful for DKs?
	},

	["WARRIOR"] = {
		[VUHDO_SPELL_ID.BUFF_BATTLE_SHOUT] = {
			{ VUHDO_SPELL_ID.BUFF_BATTLE_SHOUT, VUHDO_BUFF_TARGET_RAID, GROUP_ATK_POWER },
		},
		[VUHDO_SPELL_ID.BUFF_COMMANDING_SHOUT] = {
			{ VUHDO_SPELL_ID.BUFF_COMMANDING_SHOUT, VUHDO_BUFF_TARGET_RAID },
		},
	},

	["HUNTER"] = {
		[VUHDO_SPELL_ID.MISDIRECTION] = {
			{ VUHDO_SPELL_ID.MISDIRECTION, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_CEETAH] = {
			{ VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_CEETAH, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_CHAMELEON] = {
			{ VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_CHAMELEON, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_EAGLE] = {
			{ VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_EAGLE, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_TURTLE] = {
			{ VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_TURTLE, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_WILD] = {
			{ VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_WILD, VUHDO_BUFF_TARGET_SELF },
		},
	},

	["ROGUE"] = {
		[VUHDO_SPELL_ID.BUFF_TRICKS_OF_THE_TRADE] = {
			{ VUHDO_SPELL_ID.BUFF_TRICKS_OF_THE_TRADE, VUHDO_BUFF_TARGET_UNIQUE },
		},
		[VUHDO_I18N_LETHAL_POISONS] = {
			{ VUHDO_SPELL_ID.BUFF_DEADLY_POISON, VUHDO_BUFF_TARGET_SELF },
			{ VUHDO_SPELL_ID.BUFF_WOUND_POISON, VUHDO_BUFF_TARGET_SELF }, 
			{ VUHDO_SPELL_ID.BUFF_INSTANT_POISON, VUHDO_BUFF_TARGET_SELF },
		},
		[VUHDO_I18N_NON_LETHAL_POISONS] = {
			{ VUHDO_SPELL_ID.BUFF_CRIPPLING_POISON, VUHDO_BUFF_TARGET_SELF },
			{ VUHDO_SPELL_ID.BUFF_NUMBING_POISON, VUHDO_BUFF_TARGET_SELF },
		},
	},

	["MONK"] = {
		-- TODO: What would be useful for Monks?
	},

	["DEMONHUNTER"] = {
		-- TODO: add the class buffs that Demon Hunters provide
	},
};


VUHDO_CAST_ICON_DIFF = {
	["OTHER"] = "Interface\\Icons\\achievement_bg_tophealer_soa",
};



VUHDO_BUFF_FILTER_COMBO_TABLE = {
	{ VUHDO_ID_ALL, VUHDO_I18N_BUFF_ALL },

	{ VUHDO_ID_MAINTANKS, VUHDO_HEADER_TEXTS[VUHDO_ID_MAINTANKS] },
	{ VUHDO_ID_MAIN_ASSISTS, VUHDO_HEADER_TEXTS[VUHDO_ID_MAIN_ASSISTS] },
	{ VUHDO_ID_PRIVATE_TANKS, VUHDO_HEADER_TEXTS[VUHDO_ID_PRIVATE_TANKS] },
	{ VUHDO_ID_SELF, VUHDO_HEADER_TEXTS[VUHDO_ID_SELF] },

	{ VUHDO_ID_GROUP_OWN, VUHDO_I18N_OWN_GROUP_LONG },

	{ VUHDO_ID_MELEE_TANK, VUHDO_HEADER_TEXTS[VUHDO_ID_MELEE_TANK] },
	{ VUHDO_ID_MELEE_DAMAGE, VUHDO_HEADER_TEXTS[VUHDO_ID_MELEE_DAMAGE] },
	{ VUHDO_ID_RANGED_DAMAGE, VUHDO_HEADER_TEXTS[VUHDO_ID_RANGED_DAMAGE] },
	{ VUHDO_ID_RANGED_HEAL, VUHDO_HEADER_TEXTS[VUHDO_ID_RANGED_HEAL] },
};

VUHDO_CLASS_BUFFS_BY_TARGET_TYPE = {
	[VUHDO_BUFF_TARGET_SELF] = {},
	[VUHDO_BUFF_TARGET_SINGLE] = {},
	[VUHDO_BUFF_TARGET_UNIQUE] = {},
	[VUHDO_BUFF_TARGET_OWN_GROUP] = {},
	[VUHDO_BUFF_TARGET_TOTEM] = {},
	[VUHDO_BUFF_TARGET_STANCE] = {},
	[VUHDO_BUFF_TARGET_HOSTILE] = {},
	[VUHDO_BUFF_TARGET_RAID] = {},
	[VUHDO_BUFF_TARGET_ENCHANT] = {},
	[VUHDO_BUFF_TARGET_ENCHANT_OFF] = {},
};

