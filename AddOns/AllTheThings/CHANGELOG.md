# AllTheThings

## [SL-2.3.0](https://github.com/DFortun81/AllTheThings/tree/SL-2.3.0) (2021-04-21)
[Full Changelog](https://github.com/DFortun81/AllTheThings/compare/Shadowlands-2.2.9...SL-2.3.0) [Previous Releases](https://github.com/DFortun81/AllTheThings/releases)

- Temporarily cleaned up some logic for 'Contains' which returned progress information for itself... which is probably not necessary now that the search results are actually accurate prior to building the Contains text  
    Note about 'cost' on container items causing inaccurate numbers when they are both a cost elsewhere for a Thing which they contain... (i.e. tier tokens) [will have to revisit]  
- Fixed collection info not showing in tooltips for some items in older raids  
    Reduced indentation of our main search function  
- Comments for later  
- some night fae updates  
    removed attached questIDs from soulshapes that drop from rares in ardenweald (they will show up as collectible for night fae, but not other covenants)  
    added missing night fae map to the night fae covenant files  
- Adjusted Update logic for popout windows since Toggle performs an Update anyway  
- Removed note about account-wide quests on the quest chain window header  
- added sources to missing unsorted items (all items for hunter)  
- Added some additional hash logic for headers so they don't merge together when they have conflicting race/class/faction assignments  
- some work in NYI  
- Fixed some quest information in Org... likely different than Classic/etc. and it will need other help for those versions  
- Fixed Recipe Lib key value  
- Fixed Molten Core showing Lothos Riftwalker as the row icon/tooltip model by putting him by himself with a symlink instead  
- Cravitz Lorent is now listed in Legion Dalaran, not only Northrend Dalaran.  
- Fixed creature id for Slicer Blade  
- Quest Chain Popout windows will now ignore Account-Wide Quest completion  
    Tiny adjustments to some quest logic performance  
- Added some data caching for Faction info  
- Added caching logic for static Encounter group information  
    Fixed 'saved' property of Herilooms (though not entirely sure it's useful to have...)  
- When display information for a group has to be calculated, the result is now cached for that group  
    Added new caching logic for static Instance group information  
- Modified DisplayInfo to be returned for any group with creatures as a final fallback attempt  
    Consolidated a lot of basic true/false function references  
    Consolidated Vignette logic using the base Quest logic (since it's mostly identical)  
- ring of warding PoA  
- broke up venthyr covenant  
- broke up night fae covenant  
- broke up necrolord covenant  
- broke up kyrian covenant  
- Locale sync  
- zhCN string I missed  
- Converted Vignette lib to optimized format  
- Converted Toy lib to optimized format  
- Converted Title lib into optimized format  
- Converted Tier lib into optimized format  
- Converted Species lib to optimized format  
- Converted Spell lib to optimized format  
    Added simple true/false functions which can be re-used  
- Converted Recipe lib to optimized format  
- Formatting  
- added first 6 path of ascension fights (the wip of all wips)  
- Fixed Quest Items being considered collected when they aren't  
- Fixed a source quest in The Brood of Onyxia chain  
- Fixed visibility of completed groups in the Tradeskill window from inheriting their source group visibility  
- Sync locales  
- Fixed some collected-as-cost logic  
- fixed 3 cooking items  
- cata jewelcrafting items now have class requirements  
- valiant of stormwind cant be done if you done valiant of exodar???  
- Various minor updates  
- Added Slime Serpent mount to Plaguefall  
- Fixed the missing map message on login for auto-minilist  
- Marked an ally-only warboard quest  
- Merge branch 'master' of https://github.com/DFortun81/AllTheThings  
- When 'Use More Colors' is enabled, Class & Faction requirements in tooltips will now be colored appropriately  
    'Use More Colors' no longer considered 'Beta' :)  
    Moved the 'Beta' Label to be a separate localized string  
- Added coords for an alchemy quest  
- Various tweaks and adjustments to loading performance/logic  
    Adjustment to Minilist location update logic to skip trying to update sooner if the window is not visible  
- Added Time-Lost Hellfire Peninsula Vendor information.  
- SourceID Harvest 2021-04-17  
- Finished up and verified the Necrolord Offhand Item costs/modIDs  
- necrolord bead/spherule weapons (sans offhands)  
- Added a function to perform a callback on a method on the next game frame (so we don't have to spawn coroutines that literally do one thing and go away)  
    Cleaned up a lot of nested coroutine logic when Refreshing windows  
    The in-game source harvester now performs less retries for retriving data for items, and the previous retry limit is restored after the harvester fully completes  
- night fae mythic bead/spherule weapons  
- night fae heroic bead/spherule weapons  
- night fae normal bead/spherule weapons  
- kyrian mythic bead/spherule weapons  
    night fae lfr bead/spherule weapons  
- kyrian heroic bead/spherule weapons  
- kyrian lfr and normal bead/spherule modIDs  
- kyrian normal bead/spherule weapons  
- Fixed infinite item retrival attempts  
- Tagging removed / added quests  
- Initial touch up of Hellfire Peninsula.  
- Added all Engineering quests up to TBC.  
- Missed one!  
- Added future proofed quest data for Cooking.  
- Added a number of Alchemy quests.  
- Reimplemented the Rogue Legendary Quest chain for Dragon Soul using the latest cost tech.  
- Fixed a bug with Parser where it would crash if -- #endif was on the last line with no newline to follow.  
- venthyr mythic bead/spherule weapons  
- venthyr heroic bead/spherule weapons  
- venthyr normal bead/spherule weapons  
- ACTUALLY fixed venthyr LFR items (i hate numbers)  
- fixed venthyr lfr bead/spherule weapons (additional modID fix to come)  
- fixed kyrian lfr bead/spherule weapons (additional modID fix to come)  
- Cleaned up A "Noble" Event and its rewards. Also made it so that ATTWQ didn't lose references to it as a result.  
- fixed apogee anima bead itemID, started adding kyrian LFR weapon costs (please let me die)  
- ATTWQ now picks up the world bosses in Darkshore and Arathi Highlands once again.  
- added mikanikos follower to 'an earned bond' kyrian quest  
- I swapped for no reason :/ update to elite unique offhand  
- A "Noble Event" modifications, part 1.  
- The Rainy Day is Here no longer appears in the mini list in addition to relative to the Celestial Tournament.  
- Western Plaguelands source quest fixes  
- Fixed Music Rolls and Selfie Filters account wide setting. (missing an "And")  
    Anywhere where we check for Account Mode or Debug Mode now uses a simple boolean.  
- Removed a lot of old commented code  
- Removed some filter-checking logic for Items which was being run a gazillion times and seems pretty unnecessary  
    Slight improvement in checking the item filter type when updating groups  
    Flight Paths no longer attempt to reinsert themselves into the Main list every time the groups update  
    Minor improvements to Debug toggle refreshing speed  
    Slight adjustments to Settings logic  
- Wrong phase for the zone drop.  
- Updated Deadwind Pass formatting for Classic.  
- When running Parser, you now have to Opt-In to execute Debug Mode on the Database.  
- Parser is now x64 and supports Lua 5.4.  
- Fix typo in new preprocessor directive  
- Sync localization (#747)  
- Things which require specific Races will now Faction-color based on the Faction of those Races  
- Refactored Molten Core to add better handle their legacy quests and rewards.  
- Cleaned up Classic World Bosses and their respective loot.  
- ember court is neverending  
- Now properly handling the Lord Kazzak / Highlord Kruul swap that happens with TBC.  
- marked sinister gladiator's halberd as NYI (it's either NYI or removed, but there's no matching horde item so i assumed this weird 13th alliance item was never implemented)  
- missing ember court restock quest  
- Also updated the Parser for PTR to consider the same build options!  
- Made several adjustments to Parser to provide better version and phase filtering.  
    Added the initial rebuild of Karazhan. (which can literally be copy/pasted between Retail and TBC and rebuilt using specific versions of Parser)  
- Fixed including items in 'Contains' for cost item tooltips where the modID plays a factor in the purchasable items (i.e. Nathria Anima Spherules)  
    Fixed treating Things in the Main list as collectible if they include a modID as a part of their cost requirement (i.e. Nathria Anima Spherules)  
    Added some further information to Venthyr raid weapon vendors as (hopefully) a standard format for Covenant weapon vendors  
    Added a couple Venthyr weapon costs while testing  
    Flagged Night Fae Soulshape Quests with Night Fae Covenant  
    Removed unnecessary quest info from Soulshape items in CN (They become collectible to Night Fae characters automatically)  
- More Class Hall improvements and some vanilla source quest tweaks  
- Updated Parser to support "BEFORE" and "AFTER" commands.  
- Flight paths no longer overburden the addon when looking at a Taxi Node NPC for the first time per continent when you have hardly any cached.  
- SearchForField now only returns cached field data. It's the single most used search function we have and to have it occasionally search the entire DB recursively on error and such is a bit dangerous.  
- Removed this random vendor from being tagged with Mark of Honor  
- Marked the Every Bit Counts quests as breadcrumbs  
- Cleaned up a few more Gorgond quests  
- Modernized formatting of Gorgrond quests that are provided by items  
- Removed the header that was causing the debug message to appear.  
- Beginning Deadwind Pass and Karazhan TBC modifications.  
- Fixed Artifact Appearance collection statuses basically being completely inaccurate (Artifact collections will need to be re-cached per character due to API restrictions)  
- The Classic and TBC versions of the Parser tool now build to the .tools directory and work with a database inside the .db folder.  
- Added the Parser for PTR executable.  
- Restored the old Parser (Retail).  
- Removed the Retail to Classic Converter project since it was not used.  
    The Parser tool now supports exporting PTR database information to the PTR folder in WoW and the Classic Beta (TBC) database information to the TBC Beta folder in WoW.  
- Fixed SetPoint for Border/Background of a row Texture used in some cases (Artifacts)  
- Parser now supports a number of new preprocessor commands for its Lua database.  
    You start a command with this: -- #if  
    The follow it up with a condition like this: CLASSIC, TBC, WRATH, SHADOWLANDS, etc  
    And then write some code to execute for the condition.  
    Then finish it off with a -- #else, -- #elseif, -- #elif, or -- #endif.  
    You can nest and chain however many conditions as you want!  
- Marking these two Alliance Exlie's Reach flight paths as Never Implemented until we can prove they actually exist at some point  
- Small optimization for checking if a player is in an NPE zone when logging in  
- Modified some Flight Path DB/logic to have more accurate & consistent collectibility/display in both the main Flight Path list and within individual Zones  
    Added some Flight Nodes to the Flight Path DB which were only listed in Zones  
- shriekwing creatureID fix  
- a couple 'best friend' quests for ember court, info about summoning the rare that drops char  
- More Blade's Edge stuff.  
- Some more Outland stuff.  
- added new achievements that grant increased anima rewards  
- couple more nazmir quest fixes  
- Ruins of Gilneas is no longer nested inside Silverpine Forest (Needs some nice-ing up of the group info though...)  
    Fixed some Flightpath logic for collectibility status in Debug/Account modes  
- Modified Quest logic when Quest is tied to a Faction such that it will be considered Collected if the associated Faction is also considered Collected  
    Additional Quest logic when tied to a Faction to provide more information/be more accurate in collectibility concerns  
- Now caching factionID.  
- some nazmir quest fixes  
- blizz decided to add a neck to a dazar'alor/nazmir quest in 9.0.1 for some reason  
- Cleaned up some parts of Outland.  
    Added Ogri'la as a Faction in Blade's Edge.  
- Achievements/Criteria which is Covenant specific will now be filtered when not in Account Mode  
- GetRelative* functions will now include and prefer to check the Source parent group for pertinent information  
- Modified logic of the Source information for 'Contains' entries to not show when literally looking at the Item container or NPC which contains the Items  
    Source information for 'Contains' entries will now include the source Profession name for those items which are Crafted  
- Headers once again can use Quests and get checked off as saved. (I didn't realize how prevelant this was.)  
- Optimized the Item object type by factoring out the Collectible as Cost behaviour after no usage of itemIDAsCost was found. (by replacing the meta)  
- Fixed the parenting issue caused by sourceParent.  
- Fixed a bug with the CloneData function where it would cause a weird lookup cycle to occur for items dependent on location in the addon resulting in a retrieving data display.  
- Retrieving Data in the source locations tooltip should now cause the UI to refresh.  
- Consolidated duplicated logic for building the 'Contains' portion of a tooltip  
- some missing zuldazar mapIDs + adding a missing map to a coord  
- forgot one + added another reminder to the TODO  
- some dazar'alor intro questline tweaks/a TODO  
- Updated criteria of BB King achievement to match the current faction leaders in game.  
    Fixed an Azsuna treasure chest.  
    Added horde version of Proving Grounds quest.  
- Added some Source information for Items shown in the 'Contains' list [WIP] (Needs further adjustments and feedback)  
- Revert the ATT-Classic style of Source Location information in tooltips until we figure out a more accurate way to reflect the data in a condensed format  
- Shaman class hall tidy part 2  
- Fixed treating Things as collectible due to being a needed cost item when they are under a parent to which the current character is 'saved'  
- Reverted the collectible as cost modification other than for quests themselves until we can find an appropriate fix.  
- various small fixes for 9.0.5 content  
- EASTERN\_KINGDOMS is now the map ID constant value 13.  
- KALIMDOR is now the map ID constant value 12.  
- WORLD\_QUESTS now represent the -34 header ID.  
- FLIGHT\_PATHS now represent the -228 header ID.  
- Found some missing ISLE\_OF\_QUELDANAS map IDs.  
- THE\_EXODAR is now the map ID constant value 103.  
- AMMEN\_VALE is now the map ID constant value 468.  
- BLOODMYST\_ISLE is now the map ID constant value 106.  
- AZUREMYST\_ISLE is now the map ID constant value 97.  
- SHADOWMOON\_VALLEY is now the map ID constant value 104.  
- TEROKKAR\_FOREST is now the map ID constant value 108.  
- NETHERSTORM is now the map ID constant value 109.  
- NAGRAND is now the map ID constant value 107.  
- ZANGARMARSH is now the map ID constant value 102.  
- BLADES\_EDGE\_MOUNTAINS is now the map ID constant value 105.  
- HELLFIRE\_PENINSULA  is now the map ID constant value 100. (Can't even describe how awful finding and replacing that was!)  
- SHATTRATH\_CITY is now the map ID constant value 111.  
    Fixed a number of Silvermoon City references in Midsummer Fire Festival that incorrectly said they were map ID 111, which they aren't. They're 110. Constants are good.  
- SILVERMOON\_CITY is now the map ID constant value 110.  
- ISLE\_OF\_QUELDANAS is now the map ID constant value 122.  
- GHOSTLANDS is now the map ID constant value 95.  
- EVERSONG\_WOODS is now the map ID constant value 94.  
- Replacing ID-based constants for Outland / TBC Maps with CONSTANTS for easy transition to TBC-Classic database.  
    OUTLAND is now the map ID constant value 101.  
- Just making sure the repeatable flags are in there correctly.  
- ...  
- Added remaining Noblegarden quests in Ember Court  
    Further Ember Court HQTs  
- Now excluding quests from the Dreamweaver Provisions sym link.  
- Yet another fix for CloneData.  
- Cloning all the key values.  
- CloneData function now copies over the id every time.  
- Source Locations summarization improvements from ATT-Classic. (testing)  
- Once again filtering the Source Locations list of groups which contain the current Thing as a 'cost'  
- AltQuestID has been purged from the addon.  
    Optimized the Source Quest List in the Tooltips. (still need to refactor them in the pop out, but one thing at a time!)  
    Optimized the Quest object type.  
- Quests in the database now need to use "name" instead of "title" as part of an optimization.  
- Properly escape localized strings  
- SourceQuest and coordinate fixes in Eastern Plaguelands  
- One more  
- Localization fixes  
- Fixed Incarnadine Ink quest to not be alliance only  
- Added all of the coins and baits (as well as which baits catch which coin) for The Wish Remover in Dalaran (The Broken Isles).  
- Minor formatting difference between this and the rest of the places it was listed.  
- Now only Repeatable quests with either an itemID (a standalone quest item) or a defined cost in ATT will appear in the list outside of other filters.  
- same with some dalaran mining quests  
- marked some suramar mining quests with requireSkill so they don't show up for players with other professions  
- Fixed a bug with the mini list where Vendors didn't merge into the Vendor header already present in the zone.  
- Updated some PVP vendors in Stormwind.  
- fix for torghast vendor (maybe?)  
- Cleaned up SearchForLink.  
- Fixed Encounter tooltips on instance maps.  
- Removed a bunch of useless comments to make the tooltip logic easier to read.  
- Now showing the usage of items and currencies as cost in the Source locations portion of the tooltip as originally designed.  
- Optimized the "HasCost" function.  
- Don't use contains this way.  
    Collectible as Cost now works with things that have groups that have things within them. (IE: Burden of Eternity)  
- Adjusted the timeline isle armor tokens and burden of eternity to show a thinner tooltip for the same amount of info.  
- The portion of the tooltip used by the "Known By" section now hides the realm name for characters on your realm.  
- Flipped the state of the EnforceSkillRequirements so that profession related content is not displayed in the mini list.  
    Bind On Pickup crafted items now follow the skill enforcement regardless.  
- Cleaned up Firelands upgrade vendor items.  
- Modified search logic to include cost information even when a direct item link is provided  
    Cleaned up the Trashmaster Quests since new search logic handles it with cost properly  
- Cleaned up the Selfie Filter implementation.  
- Manually fix ruRU strings, will look into it later  
- Sync localization (#744)  
- Need to install requests explicitly too now  
- I will never edit yaml outside of configured editor again  
- Fix kerfuffle  
- Set up Python explicitly in workflows  
- Fix GetSpellInfo objects and prettify a bit  
- selfie filter option is now free, kinda  
- Prepare localization for new objects  
- Optimized and the PVP Rank and Selfie Camera object types.  
    The S.E.L.F.I.E. Camera MkII toy now properly shows the filters in its tooltip.  
- Tome of Cold Weather Flight was never a World Drop.  
- Fixing providers for Nazjatar profession quests.  
    Nuked the NYI files to simplify the structure.  
- Optimized the Profession object type.  
    Also destroyed a number of headers that were pretending to be a profession.  
- Priest Class Hall clean-up part 2  
- Couple Quest fixes  
- Found some more references to "creatureID" that was actually intended for "headerID"... yikes.  
- This was necessary for World Quest lists in /attwq to not show "RETRIEVING DATA" on certain items.  
- World Quests will no longer show themselves in the list if they are active without additional filtering.  
- Optimized the Pet Lib object classes.  
- New parser!  
- I used my big boy brain to export the data associated with objects that are in enUS and add the missing keys as an empty string for a simple copy+paste!  
- Parser now spits out a long list of objectIDs that are missing localization for enUS.  
- Rearranged some Island Expedition sequential Missions  
    Further Quest Clean up  
- Fixed a string in the Parser that got changed in Source  
- Various Quest clean up  
    Removed many HQTs which are listed on an actual Thing already  
- Optimized the world Object object type.  
    Objects now report when they are missing localization on startup. (have fun!)  
- Fixed the Purified Titan Essence symbolic link.  
- Fixed the ToT tooltip issue.  
- Fixed an issue with the Mini List where it wouldn't reapply the achievement data for the header if it was a map.  
- Saved is now more consistent for trackable things.  
- Fixed Quest Items not being considered collected account-wide  
- Modified Quest Item logic to use the same collection logic as actual Quests  
- I removed this earlier. :)  
- Optimized the NPC object type. Converted the piggy backed negative NPC IDs (aka "custom npcs) into their own object key, "headerID".  
- Quests now only show the in-row checkmark if the current character has completed the Quest  
- Fixed value for map info API call  
- Not sure why this fixes the display in ATTWQ, but it does.  
- Optimized the Music Roll object type.  
- Optimized the Mount object type.  
- Optimized the Map object type.  
- Added a bit of logic to the Parser to save a list of duplicate-listed Quests at the end of the output (only visible by opening the log.txt file created by the Parser). These show most non-repeatable Quest entries which are directly listed more than once in the Source  
- Missed the new item as cost cache for determining a filterID for items.  
- Moving forward for Classic/TBC, we are no longer writing filterID for Reagents and Quest Items. (these are auto detected on the front end now)  
- Priest & Shaman Class Hall improvements & tidy up  
- Ember Court HQT updates  
    Some Easter Egg repeatables for Ember Court during Noblegarden  
- Removed the old collectible as cost function.  
- Greatly improved the performance of the Item object type. (And it now supports 4 different types of collectible detection: Quest, Faction, Achievement, and Transmog)  
- Shifted some things around based on TBC-Classic structure.  
- Moved Ulduar enchanting patterns to Common Boss Drops, these have been confirmed to drop from more bosses than the ones that were listed  
- Optimized the Instance object type. You can now link the dungeon journal listing in chat by shift left clicking the name of the instance in ATT.  
- ...  
- ...  
- Optimized the Illusions object type.  
    Cleaned up all of the Illusions created by Enchanting. They're now listed in their respective "Crafted Items" sections.  
- some more unsorted dungeon satchels that were bugging me  
- Optimized the Holiday object type. Additionally, fixed the icon bug that caused the icons to get cut off.  
- Signficantly improved overall addon performance by optimizing the Achievement Criteria object type.  
- Optimized the Heirloom object types.  
    Also fixed a bug with removed from game heirlooms where they would fail to retrieve an icon.  
- Optimized the Gear Set object types.  
- Optimized the Garrison object types.  
- Greatly improved performance for the Achievement and Follower object types.  
- Just some TODOs for future  
- Optimized the Flight Path object type.  
- Improved the performance of the Flight Path object type.  
- Optimized the Filter object type.  
- Factions now show their reputation levels in the tooltip and how much reputation remains to Exalted/Best Friend.  
    Greatly optimized the Faction object type.  
- Optimized the Difficulty and Encounter object types. Cleaned up the lockout tooltip code.  
- The icons used for sections in the Profession Window now match the Main List.  
- Added the Death Tracker module. (Total Deaths - currently only visible while in Debug Mode.)  
- Optimized the Currency Object type.  
- Removed some unused data from the Unit Class.  
- some hqt stuff/garrison quests  
- Minor class improvement for the Character Class object type. Also removed a pointless comment block.  
- Removed the default 10 second timer.  
- Fixed an issue with Soft Reserve Edit Boxes.  
- Removed some useless block comments.  
- Synchronizing base.lua updates between Classic and Retail ATT.  
- Small tweak for Faction mode string  
- Localize prep for Faction mode  
- removed helya recipe rank3 from heroic  
- added reagents for synchronous thread, an hqt, and fixed crs for a horde siege of boralus encounter  
- Added a TBC build configuration for the Parser tool.  
    Parser now supports excluding data based on Phase Identifiers.  
- Added "Only Current Faction" for Account Mode to show account data for the current faction. (Shaman and Paladin content is also hidden in ATT-Classic for their respective enemy faction while in this mode.)  
    This new mode will be indicated as "Faction ___ Mode" in the mode string.  
- Now using the app.asset helper function for local ATT assets.  
- Enforcing the naming convention for Category Icons.  
- Now using the app.asset helper function for commonly referenced assets.  
- Enforcing the naming convention for Difficulty Icons.  
- More Expansion Lib modifications.  
- Removed an unused comment chunk.  
- ATT Asset naming convention enforcement: Expansion Icons.  
- Added Asset Helper functions. (for copy+paste between addon versions)  
- forgot to change one instance of 'heroic' in documentation, whoops  
- azerite armor caches drop normal-difficulty pieces now because blizzard hates us  
- Priest Class Hall improvements and clean up  
- Removed some usage of Valor which is no longer accurate due to the currency being re-introduced into the game for a completely new purpose  
- all the & things 3.0 data  
- Sync localization (#741)  
- Small change to localization script  
- Now reporting when an item is excluded because of its itemID. (temporary)  
- added crs for bfa lfr queue npcs  
    added some missing uldum/vale assault zone drop recipes  
    hashtag errors  
- Added Shadowlands Keystone Explorer: Season One  
- Marked Technique: Codex of the Tranquil Mind (Rank 3) as obtainable again - confirmed that it dropped from an emissary chest (let us know if anyone gets it to drop from a dungeon boss)  
- Added VanCleef's Boots to Hyper-Compressed Ocean drops  
- Marked Technique: Codex of the Tranquil Mind (Rank 3) as unobtainable - no evidence that this has dropped since the end of Legion  
- Ember Court updates & HQTs  
- More Deathknight Class Hall improvements  
- Fixed/reorganized all Legion mining to not show things that have already been completed as incomplete  
- More Legion herbalism fixes to make completed things not show up incorrectly in the zone minilists  
- removed a scenario map from overall ICC map list  
    tweaked outposts so only real quests are utilized and moved missions hqts to the hqt file (like other expansion mission hqts)  
- hqts, some ember court rewards, added crs to a rare in vol'dun  
- Fixed all other Legion herbs to not show things that have already been completed as incomplete  
- Fixed Fjarnskaggl to not show things that have already been completed as incomplete  
- Slight memory usage improvement for repeatedly opening a popout window of a Quest group  
    Fixed some logic concerning finding a duplicate Quest group which contains source Quests when the popout group does not contain source Quests  
- Some clean up to reduce memory usage when creating/re-opening popout windows  
- For those at 99% or more, the number of things to the next 1% threshold in the tooltip is now more precise.  
- Nested Venthyr achieves under The Party Herald in the main achieves section  
- Added several Venthyr achieves/criteria to the main achievements section  
- Marked BoE version of Rhinestone Sunglasses as obtainable.  
- Added HQTs for PvP ensembles (all 624 of them!)  
- Added coords for Warden's Scroll Case and fixed name  
- Added Trial of Style ensemble HQTs  
- Trial of Style HQTs linked to Letter from an Admirer  
- added a missing drop to orstus/sotiros  
- HQT during WQ  
- Added a couple sourceQuests in Azuremyst Isle  
- Delete auto\_localization branch to speed up things  
- Sync localization (#736)  
- Adjusted the RSVP requirements for Droman Aliothe for 9.0.5 changes  
    Added an Ember Court restock quest  
    Fwd: Fwd: Fwd: Re: Re: Fwd: Re: Ember Court HQT's  
- Fixed quest giver for Dread Head Redemption  
- Removed an incorrect Felwood source quest  
- Added Jeweled Arakkoa Effigy.  
    Added coords for Demon Duty.  
- Changed WOD\_CRAFTED\_ITEM to mark tiers 2-6 unobtainable. Note that this currently causes tier 1 to also be marked unobtainable (and display the 'salvage crate' red text) until parser is updated to handle it.  
    Added a couple more AbomiThings.  
- Adjusted some classic source quests  
- more soul crs  
- fixed typo in buckled plate belt itemID  
- Added a Stormsong Valley WQ (Work Order: Solstone)  
- hqt, added chan's imperial robes to mith'rethis in the hinterlands (not a guaranteed drop, but a very high chance for this rare item!)  
- hqt, missing revendreth zone reward, another ember court thing sourced  
- More localization fixes  
- Copy esES objects to esMX when autolocalizing  
- Update description on Endgineer Omegaplugg  
- Locale sync  
- Update zhCN (#733)  
- ammen vale is now a subzone of azuremyst isle, similar to the other starting areas  
- icon for caverns  
- burden of eternity fix  
    marked a breadcrumb  
    more ashran shit  
- Improved Tradeskill window logic and fixed bugs (fixes #694) (fixes #734)  
- Reworked Tydormu to use "cost" so that he no longer will show tokens for PvP items that he doesn't sell  
- Fixed Merciless Gladiator's Felweave helm/shoulder tokens that were backwards  
- Removed a double description  
- caverns are now finished (and not only on allthethings)  
- fix for the previous scroll items  
- caverns of time split  
- removed some duplicating from the great sea scroll quest. Still a bit buggy and displaying the azerite items with 2 sources (4 if debug) when it should only be 1 source (2 in debug)  
- Sync localization (#731)  
- Another fix  
- More fixes :D  
- Fix sync script  
- Add auto localization for object names (#727)  
- extra info for some azerite items  
- Added more AbomiThings  
- Added some sourceQuests (25422 & 25423)  
- Added some missing Ashran achievement criteria  
- added pre-req for the quest Assisting the Consortium  
- #errors (delete garrisons)  
    marked some breadcrumbs  
    really nothing else of value/import  
- Missing WQ tag in Broken Shore  
- Added map to Crossing Legion Lines (43394)  
- Added Purity's Edge Greatblade  
- Added Abomination Station tier 4 quests  
- Slight adjustment to caching items so that the raw ItemID always exists in the cache  
- Removed some currently unnecessary logic with a note for future me to adjust  
    Added suspected source quests for a couple Night Fae souls quests  
    Added a T5 Ember Court quest and RSVP/HQTs for The Countess  
- Fixed categories, manually.  
- Undid a thing.  
- Legion Class Hall (Warlock, Shaman & Priest) clean-up & some #errors  
- Fixed a broken quest in arathi highland not showing the correct quest-chain.  
- Determined a couple specific HQTs for Ember Court Guests  
- Removed nested marks of thrallmar / honor hold  
- Legion Class Hall (Shaman & Warlock) updates part 1  
- Added The Vials of Eternity as sourceQuest for the Scale of the Sands ring questlines  
- Formatting (and misleading comments :D)  
- And now after parsing...  
- Legion DK class hall quests & HQTs  
- Another legion enchanting quest added.  
- added 3 quests in the legion enchanting questline.  
- Added a couple maps to a Legion quest  
    Removed duplicate Ember Court quest and added a missing one  
