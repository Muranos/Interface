# AllTheThings

## [DF-3.11.0](https://github.com/DFortun81/AllTheThings/tree/DF-3.11.0) (2024-04-29)
[Full Changelog](https://github.com/DFortun81/AllTheThings/compare/DF-3.10.8...DF-3.11.0) [Previous Releases](https://github.com/DFortun81/AllTheThings/releases)

- added code coloring for the different transmog items you can buy with fated tokens  
- API Harvester builds in .NET Framwork 4.8 now  
    Adjusted minimum API timing to 100ms to try and prevent Blizzard's extreme throttling  
    Re-harvested Item/Quest DBs for 10.2.6  
    Commented in the 10.2.6 upgrade bonusIDs  
- Parsed for release  
- Added object data for Agamand Weapon Racks and Serpentbloom.  
- Added objectIDs for Water Pitcher, Harpy Foodstuffs, and Sacred Fire of Life.  
- HideUIPanel is apparently required to be called instead of using the :Hide.  
- Added Berard's Bookshelf.  
- No more lock criteria? never was  
    Who knows?  
- Did someone say NYI items?  
- Added some missing objects to the Hinterlands.  
- Some HQTs from #classic-errors  
- Removed an HQT from the classic only NYI file.  
- Battle of Hillsbrad (7/7) has two versions, based on Battle of the Undercity completion.  
- Fixed DF S4 catalyst symlinks  
    Fixed 'modItemID' search for symlinks  
- Mounts are properly considered Trackable  
    Quest 'OneTimeQuests' now linked during proper event  
    CharacterUnlocks Class now using standard collection logic  
    CharacterUnlocks now properly consider once-per-account unlocks (i.e. Garrison Shipyard blueprints)  
- Generate Missing Files  
- Sorting RecipeIDs  
- SearchForObject no longer does an id fallback when searching by 'modItemID' (continues to do so for 'itemID')  
    Chat `/att [text]` commands now search for items via 'modItemID' to ensure only the exact Item is returned or generated  
    Chat `/att i:[itemID]:[modID]:[bonusID]` is now an acceptable format for input  
- Harvest: 11.0.0.54361  
- Harvest: 10.2.7.54366  
- Harvest: 10.2.7.54295  
- Harvest: 10.2.6.54358  
- Harvest: 4.4.0.54427  
- Harvest: 4.4.0.54377  
- Harvest: 4.4.0.54339  
- Harvest: 1.15.2.54332  
- Objects for Tome of the Cabal.  
- Hearts of the Lovers and Wish You Were Here are alt quests of each other.  
- Added the Burning Blade Stash.  
- ARCHAEOLOGY wasn't added until Cata. Tiiiimelines!  
- The Assassin (horde quest) couldn't be picked up until I finished this quest.  
- Update Shadowmoon Valley.lua  
- In Favor of Spirituality starts in the Valley of Trials.  
- Oh, just kidding. 225. Tribal has an additional Wild Leather quest chain requirement. (Thanks for making me spend gold... Blizzard!)  
- Leatherworking specializations are actually 240.  
- Added some missing object data to some Rogue Ghostland quests.  
- Classic: Added a "Filter Specific Things" window to summarize what you are missing by filter.  
- CreateObject can use 'modItemID' field in a table to make a proper Item object  
- Added Large Throwing Knife.  
- Report to Captain Helios is not a source quest for all these quests.  
- Time rift vendor is back  
- Underbog: Sanguine Hibiscus  
- typo  
- Added all remaining items for season 4 PvE catalyst.  
    Fixed TBC HQT.  
- Added some missing items to Eversong Woods.  
- Revisit Spirit Shard: Timelines  
- Gloom Weed objectID.  
- The Hammer May Fall was not a source quest for Call to Arms (1/3)  
- Required Normal at a minimum not LFR  
- Added some missing objects to Tirisfal Glades.  
- Added object data for Balnir Snapdragons/Arugal's Folly.  
    Adjusted logical format for Proving Allegiance.  
    Fixed "Eversong Ranger Blessed 0/6 was added to your collection" when learning PW:F.  
- Pandamix icons (change them if you don't like them)  
- parsed  
- Venthyr Objects  
- Automation no worky, setting these up manually :(  
- Bit of pandamix achievement cleanup plus fix lfg jade forest  
- Spirit Shard (Auchindoun dungeons)  
- Another object for mage quest(s).  
- Fixed object tooltips for the mage quest in Undercity.  
- Ley Staff (mage only quest reward) is no longer incorrectly listed under rogue quests.  
- Reparsed all DBs.  
- Duskwing, Oh How I Hate Thee... has several source quests.  
- Added skill requirement for the wild leather quests.  
- Wrath: Elixir of Pain/Agony/Suffering can all be done at the same time.  
- Retail: Improved Faction collection to use a throttled, non-combat event to check for new completed factions for a character (also fixed a recursion issue, due to no longer doing a collection refresh on every collected check)  
- Classic: Added a window for race-specific things! /attraces  
- Classic: Changed the Class Quests window to "Class Specific Things"  
- Classic: Fixed a bug with syncing.  
    Adjusted the Grimtotem Satchel.  
- Retail: Fixed Sources in popouts for Achievements  
- Fixed a couple object tooltips in Thousand Needles and Desolace.  
- Rebuilt classic DBs  
- Some skinning quests missing timelines.  
- Awakened crests first craft qids  
- Warsong Axe Shipment's coordinate was wrong.  
- 8.2 QIs  
- upgrade module bonusIDs for s4 and commented s3  
- No printing, this isn't Kinko's!  
- Classic now uses the event logic.  
- Well, lib/Runner doesn't break anything when enabled anymore...  
- updated ptr data for crests vendor in Valdrakken  
- Adjusted Generic Object Containers to make logic simpler for themselves and sub-objects  
    Generic Objects should now work properly with the Vignette Reporting feature  
- Adjusted some rogue quests.  
- Classic: Added a "Class Quests" window (/attclq)  
- Linked 'Goggle Wobble' criteria to respective required WQs  
- ...  
- Overzealous constant replacement detected  
- Fixed some quests in Durotar/Zalazane's Fall.  
- Added all season 4 pvp catalyst items.  
    Symlinked all season 4 pve items into catalyst.  
- backlog clearup a little bit  
- Wago export update  
- Added ToT ensembles  
- Realm First! Timerunner yeeted?  
- Achievement harvest (10.2.7)  
- Gonna assume Dreamsurge Vendors will be fixed since otherwise people will see removed on all their random BoA drops and I ain't dealing with that...  
- Found a first skin HQT  
- Fixed incorrect map assignment.  
- Added The Prince's Chest to Dire Maul.  
- Couple object fixes for Dire Maul.  
- Dire Maul zone drops and common boss drops now appear in the mini lists of their submaps.  
- T0.5 quests inside dire maul should once again appear in the respective subzones when viewing the mini list.  
- deadman dagger collecting trick  
- added Antique Bronze Bullion  
- Couple Dreamsurge adjustments  
- Commented example command to test report dialog  
- Added Cache of Storms to Zone Rewards with symlinked content groups as personally received  
- Cache of Storms  
- Using a filter on bubbleDown so the NPC tooltips don't show removed, only their Items  
- if fixes with actual build number instead of placeholder  
- Fixed ShowPopupDialogWithMultiLineEditBox function  
    Fixed S4 removed timeline & current Retail config  
- Weekly Quest?  
- updated wrong row for 1  
- Removed the "OI" print message.  
- s4 timeline updated  
- Reparsed DBs!  
- It's fine to have CRS contain the mob(s) that previously dropped an item until the source actually changes within the context. (fixes a parser warning in Cata Classic)  
- Whoops, this wasn't supposed to get changed.  
- Updated all "deleted" timeline strings to use constants.  
- Updated all "added" timeline strings to constants.  
- Updated all "created" timeline strings to constants. (or shifted them to their closest patch)  
- Updated all "removed" timelines to use a constant instead of a string.  
- Cata: Illusions aren't in yet.  
- Awakened Storms is Normal+  
- Zangarmarsh: Sporeling Sprout  
- Timerift and Dreamsurge vendors are missing, RIP  
- Primal Storms can no longer spawn inside Primalist Future sub-map  
- ......  
- Revert "C\_Spell Namespace for testing"  
- Merge branch 'master' of https://github.com/DFortun81/AllTheThings  
- Harvested sources (some older ones changed... not sure what that's about)  
- SL Vicious PvP Mounts are obtainable via Saddles, not via general PvP (PvP re-org when...?)  
- Added more NYI explorations.  
- Added all missing explorations into NYI. Found duplicated The Maw explorations on my alt.  
- Timelines should be accurate to their specific Source  
- Old Hillsbrad Foothills description  
- Little bit of plunder time left :)  
- Parser config for S4 (needs real version number adjusted in timelines + here) + harvest items  
- 'Fake' maps will still return proper Player Coordinates data for the 'real' map underneath...  
- Wrath objects  
- extra note as people keep reporting the sl prepatch event unobtainable items  
- Timeline strings starting with "removed 2.X.X" have been converted to a constant.  
- Timeline strings starting with "removed 3.X.X" have been converted to a constant.  
- Timeline strings starting with "removed 4.3.X" have been converted to a constant.  
- Timeline strings starting with "removed 4.1.X" and "removed 4.2.X" have been converted to a constant.  
- Timeline strings starting with "removed 4.0.X" have been converted to a constant.  
- Timeline strings "added 4.2.2", "added 4.3.0", and "added 4.3.2" converted to constants.  
- Timeline strings starting with "added 4.2.0" now utilize a constant.  
- Timeline strings starting with "added 4.1.0" converted to using a constant.  
- Timeline strings starting with "added 4.0.6" have been converted to using a constant. (safer to do this in chunks...)  
- Timeline strings starting with "added 4.0.1" have been converted over to using a constant.  
- More timeline strings changed to using constants. (there's a reason for this, you'll see. I have a plan!)  
- TBC Karazhan: Koran minReputation  
- Not sure when, but DoNothing doesn't exist anymore.  
- Cata: Fixed tooltips.  
- TBC Karazhan: Koren  
- GetPlayerPosition doesn't like getting called with a nil mapID.  
- Exploration objects with no name now show 'Unknown' instead of 'Retrieving data' (I don't think the map function has async returns)  
    Retail: /att list only attempts to retrieve SourceID on groups when there is an existing itemID  
- Retail: Exploration type fixed for some logic handling which requires 'Things' in the game  
- Retail: Fixed a weird sequence Lua error due to out-of-order calls of Minimap button OnEnter  
- Added the objectID for the service entrance to Stratholme.  
- Retail: Can now properly create Exploration objects dynamically from raw tables  
    Exploration returns 'name' not 'text' directly (fixes Sorting by name and other situations where 'name' is expected to exist)  
- C\_Spell Namespace for testing  
- test  
- Merged items for MoP Remix raids into armor groups.  
- Let's move that to the top....  
- Updated TradeSkillUI code.  
- VSCode lied to me, this does NOT return an array.  
- Wrath Classic timeline constants.  
- Changed all 5.1.0 and 5.2.0 timeline strings into constants.  
- Changed all "removed 4.0.3" strings into the REMOVED\_4_0\_3 constant.  
- Changed all "added 4.0.3" strings into their respective constants.  
- VSCode is now quiet!  
- Archaeology Fix up  
