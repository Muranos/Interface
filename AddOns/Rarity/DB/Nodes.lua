-- Upvalues
local R = Rarity

-- Externals
local L = LibStub("AceLocale-3.0"):GetLocale("Rarity")

R.coins = {
	-- Mists of Pandaria
	[697] = true, -- Elder Charm of Good Fortune
	[752] = true, -- Mogu Rune of Fate
	[776] = true, -- Warforged Seal
	-- Warlords of Draenor
	[994] = true, -- Seal of Tempered Fate
	[1129] = true, -- Seal of Inevitable Fate
	-- Legion
	[1273] = true, -- Seal of Broken Fate
	-- Battle for Azeroth
	[1580] = true -- Seal of Wartorn Fate
}

R.fishnodes = {
	-- Classic through Cataclysm
	[L["Floating Wreckage"]] = true,
	[L["Patch of Elemental Water"]] = true,
	[L["Floating Debris"]] = true,
	[L["Floating Debris Pool"]] = true,
	[L["Oil Spill"]] = true,
	[L["Firefin Snapper School"]] = true,
	[L["Greater Sagefish School"]] = true,
	[L["Oily Blackmouth School"]] = true,
	[L["Sagefish School"]] = true,
	[L["School of Deviate Fish"]] = true,
	[L["Stonescale Eel Swarm"]] = true,
	[L["Muddy Churning Water"]] = true,
	[L["Highland Mixed School"]] = true,
	[L["Pure Water"]] = true,
	[L["Bluefish School"]] = true,
	[L["Feltail School"]] = true,
	[L["Brackish Mixed School"]] = true,
	[L["Mudfish School"]] = true,
	[L["School of Darter"]] = true,
	[L["Sporefish School"]] = true,
	[L["Steam Pump Flotsam"]] = true,
	[L["School of Tastyfish"]] = true,
	[L["Borean Man O' War School"]] = true,
	[L["Deep Sea Monsterbelly School"]] = true,
	[L["Dragonfin Angelfish School"]] = true,
	[L["Fangtooth Herring School"]] = true,
	[L["Floating Wreckage Pool"]] = true,
	[L["Glacial Salmon School"]] = true,
	[L["Glassfin Minnow School"]] = true,
	[L["Imperial Manta Ray School"]] = true,
	[L["Moonglow Cuttlefish School"]] = true,
	[L["Musselback Sculpin School"]] = true,
	[L["Nettlefish School"]] = true,
	[L["Strange Pool"]] = true,
	[L["Schooner Wreckage"]] = true,
	[L["Schooner Wreckage Pool"]] = true,
	[L["Waterlogged Wreckage"]] = true,
	[L["Waterlogged Wreckage Pool"]] = true,
	[L["Bloodsail Wreckage"]] = true,
	[L["Bloodsail Wreckage Pool"]] = true,
	[L["Lesser Sagefish School"]] = true,
	[L["Lesser Oily Blackmouth School"]] = true,
	[L["Sparse Oily Blackmouth School"]] = true,
	[L["Abundant Oily Blackmouth School"]] = true,
	[L["Teeming Oily Blackmouth School"]] = true,
	[L["Lesser Firefin Snapper School"]] = true,
	[L["Sparse Firefin Snapper School"]] = true,
	[L["Abundant Firefin Snapper School"]] = true,
	[L["Teeming Firefin Snapper School"]] = true,
	[L["Lesser Floating Debris"]] = true,
	[L["Sparse Schooner Wreckage"]] = true,
	[L["Abundant Bloodsail Wreckage"]] = true,
	[L["Teeming Floating Wreckage"]] = true,
	[L["Albino Cavefish School"]] = true,
	[L["Algaefin Rockfish School"]] = true,
	[L["Blackbelly Mudfish School"]] = true,
	[L["Fathom Eel Swarm"]] = true,
	[L["Highland Guppy School"]] = true,
	[L["Mountain Trout School"]] = true,
	[L["Pool of Fire"]] = true,
	[L["Shipwreck Debris"]] = true,
	[L["Deepsea Sagefish School"]] = true,
	-- Mists of Pandaria
	[L["Emperor Salmon School"]] = true,
	[L["Giant Mantis Shrimp Swarm"]] = true,
	[L["Golden Carp School"]] = true,
	[L["Jade Lungfish School"]] = true,
	[L["Krasarang Paddlefish School"]] = true,
	[L["Redbelly Mandarin School"]] = true,
	[L["Reef Octopus Swarm"]] = true,
	[L["Floating Shipwreck Debris"]] = true,
	[L["Jewel Danio School"]] = true,
	[L["Spinefish School"]] = true,
	[L["Tiger Gourami School"]] = true,
	[L["Large Swarm of Migrated Reef Octopus"]] = true,
	[L["Large Pool of Sha-Touched Spinefish"]] = true,
	[L["Large Pool of Glowing Jade Lungfish"]] = true,
	[L["Large Pool of Crowded Redbelly Mandarin"]] = true,
	[L["Large Tangled Mantis Shrimp Cluster"]] = true,
	[L["Large Swarm of Panicked Paddlefish"]] = true,
	[L["Large Pool of Tiger Gourami Slush"]] = true,
	[L["Large Pool of Glimmering Jewel Danio Pool"]] = true,
	[L["Large Pool of Brew Frenzied Emperor Salmon"]] = true,
	[L["Brew Frenzied Emperor Salmon"]] = true,
	[L["Glimmering Jewel Danio Pool"]] = true,
	[L["Tiger Gourami Slush"]] = true,
	[L["Swarm of Panicked Paddlefish"]] = true,
	[L["Tangled Mantis Shrimp Cluster"]] = true,
	[L["Crowded Redbelly Mandarin"]] = true,
	[L["Glowing Jade Lungfish"]] = true,
	[L["Sha-Touched Spinefish"]] = true,
	-- Warlords of Draenor
	[L["Abyssal Gulper School"]] = true,
	[L["Oily Abyssal Gulper School"]] = true,
	[L["Blackwater Whiptail School"]] = true,
	[L["Blind Lake Sturgeon School"]] = true,
	[L["Fat Sleeper School"]] = true,
	[L["Fire Ammonite School"]] = true,
	[L["Jawless Skulker School"]] = true,
	[L["Sea Scorpion School"]] = true,
	[L["Oily Sea Scorpion School"]] = true,
	[L["Savage Piranha Pool"]] = true,
	-- Legion
	[L["Black Barracuda School"]] = true,
	[L["Cursed Queenfish School"]] = true,
	[L["Runescale Koi School"]] = true,
	[L["Fever of Stormrays"]] = true,
	[L["Highmountain Salmon School"]] = true,
	[L["Mossgill Perch School"]] = true,
	-- Battle for Azeroth
	[L["Frenzied Fangtooth School"]] = true,
	[L["Great Sea Catfish School"]] = true,
	[L["Lane Snapper School"]] = true,
	[L["Rasboralus School"]] = true,
	[L["Redtail Loach School"]] = true,
	[L["Sand Shifter School"]] = true,
	[L["Slimy Mackerel School"]] = true,
	[L["Tiragarde Perch School"]] = true,
	[L["U'taka School"]] = true,
	[L["Mauve Stinger School"]] = true,
	[L["Viper Fish School"]] = true,
	[L["Ionized Minnows"]] = true,
	[L["Sentry Fish School"]] = true,
	[L["Aberrant Voidfin School"]] = true,
	[L["Malformed Gnasher School"]] = true,
	-- Shadowlands pools
	[L["Iridescent Amberjack School"]] = true,
	[L["Pocked Bonefish School"]] = true,
	[L["Silvergill Pike School"]] = true,
	[L["Elysian Thade School"]] = true,
	[L["Lost Sole School"]] = true,
	[L["Spinefin Piranha School"]] = true
}

R.miningnodes = {
	-- Classic through Cataclysm
	[L["Copper Vein"]] = true,
	[L["Tin Vein"]] = true,
	[L["Iron Deposit"]] = true,
	[L["Silver Vein"]] = true,
	[L["Gold Vein"]] = true,
	[L["Mithril Deposit"]] = true,
	[L["Ooze Covered Mithril Deposit"]] = true,
	[L["Truesilver Deposit"]] = true,
	[L["Ooze Covered Silver Vein"]] = true,
	[L["Ooze Covered Gold Vein"]] = true,
	[L["Ooze Covered Truesilver Deposit"]] = true,
	[L["Ooze Covered Rich Thorium Vein"]] = true,
	[L["Ooze Covered Thorium Vein"]] = true,
	[L["Small Thorium Vein"]] = true,
	[L["Rich Thorium Vein"]] = true,
	[L["Dark Iron Deposit"]] = true,
	[L["Lesser Bloodstone Deposit"]] = true,
	[L["Incendicite Mineral Vein"]] = true,
	[L["Indurium Mineral Vein"]] = true,
	[L["Fel Iron Deposit"]] = true,
	[L["Adamantite Deposit"]] = true,
	[L["Rich Adamantite Deposit"]] = true,
	[L["Khorium Vein"]] = true,
	[L["Large Obsidian Chunk"]] = true,
	[L["Small Obsidian Chunk"]] = true,
	[L["Nethercite Deposit"]] = true,
	[L["Cobalt Deposit"]] = true,
	[L["Rich Cobalt Deposit"]] = true,
	[L["Titanium Vein"]] = true,
	[L["Saronite Deposit"]] = true,
	[L["Rich Saronite Deposit"]] = true,
	[L["Obsidium Deposit"]] = true,
	[L["Huge Obsidian Slab"]] = true,
	[L["Pure Saronite Deposit"]] = true,
	[L["Elementium Vein"]] = true,
	[L["Rich Elementium Vein"]] = true,
	[L["Pyrite Deposit"]] = true,
	[L["Rich Obsidium Deposit"]] = true,
	[L["Rich Pyrite Deposit"]] = true,
	-- Mists of Pandaria
	[L["Rich Pyrite Deposit"]] = true,
	[L["Ghost Iron Deposit"]] = true,
	[L["Rich Ghost Iron Deposit"]] = true,
	[L["Black Trillium Deposit"]] = true,
	[L["White Trillium Deposit"]] = true,
	[L["Kyparite Deposit"]] = true,
	[L["Rich Kyparite Deposit"]] = true,
	[L["Trillium Vein"]] = true,
	[L["Rich Trillium Vein"]] = true,
	-- Warlords of Draenor
	[L["True Iron Deposit"]] = true,
	[L["Rich True Iron Deposit"]] = true,
	[L["Blackrock Deposit"]] = true,
	[L["Rich Blackrock Deposit"]] = true,
	-- Legion
	[L["Leystone Deposit"]] = true,
	[L["Rich Leystone Deposit"]] = true,
	[L["Leystone Seam"]] = true,
	[L["Felslate Deposit"]] = true,
	[L["Rich Felslate Deposit"]] = true,
	[L["Felslate Seam"]] = true
}

R.opennodes = {
	[L["Crane Nest"]] = true,
	[L["Timeless Chest"]] = true,
	[L["Snow Mound"]] = true,
	[L["Glimmering Treasure Chest"]] = true,
	[L["Curious Wyrmtongue Cache"]] = true,
	[L["Glimmering Chest"]] = true,
	[L["Pile of Coins"]] = true,
	[L["Mailbox"]] = true,
	[L["Penitence of Purity"]] = true,
	[L["Silver Strongbox"]] = true,
	[L["Gilded Chest"]] = true,
	[L["Broken Bell"]] = true,
	[L["Skyward Bell"]] = true,
	[L["Cache of the Ascended"]] = true,
	[L["Slime-Coated Crate"]] = true,
	[L["Sprouting Growth"]] = true,
	[L["Stewart's Stewpendous Stew"]] = true,
	[L["Bleakwood Chest"]] = true,
	[L["Blackhound Cache"]] = true,
	[L["Secret Treasure"]] = true,
	[L["Forgotten Chest"]] = true,
	[L["Cache of Eyes"]] = true,
	[L["Dirty Glinting Object"]] = true,
	[L["Gift of Thenios"]] = true,
	[L["Hidden Hoard"]] = true,
	[L["Memorial Offerings"]] = true,
	[L["Treasure of Courage"]] = true,
	[L["Zovaal's Vault"]] = true
}
