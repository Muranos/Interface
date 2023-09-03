# AllTheThings

## [DF-3.5.7](https://github.com/DFortun81/AllTheThings/tree/DF-3.5.7) (2023-08-27)
[Full Changelog](https://github.com/DFortun81/AllTheThings/compare/DF-3.5.6-hotfix-2...DF-3.5.7) [Previous Releases](https://github.com/DFortun81/AllTheThings/releases)

- GetMapName always returns a string, no fallback needed.  
- Updated the GetMapName function.  
- Trial of Valor - moved common boss drop outside of LFR and found last Ensemble HQT.  
- Classic: Adjusted the UpdateMap function.  
- Merge branch 'master' of https://github.com/DFortun81/AllTheThings  
- Tailoring Fix  
- Fixed the mini list for people that don't use it. KEKW  
- Classic: Updated the GetBestMapForGroup function to only return a different map if it doesn't match the current map.  
- Sea Turtle now appears in the mini list for all of its associated wrath zones.  
- Most TBC raids confirmed not needing zone-text-areaID for anything after TBC.  
- Fixed Timbermaw Hold.  
    Retail: Fixed various other map related problems.  
- Added the Link ATT to WoW batch file. (this replaces all symlinks in the folder with the current one)  
- The areaID for Timbermaw changed with Cataclysm apparently.  
- Minor changes to rare/world boss icons  
- ZG has another mapID in Classic. TODO: Check if this also exists in Retail.  
- Marked a few LFR zone drops unobtainable. These have not been confirmed from what I can see, so wait until further notice  
- Added Tailoring 10.1.7 Achievements  
- Some Additional Cleanup of Illusions  
- Added Heroic Doti  
- Some Clean up of Illusion and Mounts  
- monthly prime update  
- Collector's editions will no longer show up outside of Battlenet Balance filtering or Debug Mode.  
- The asset function isn't callable. You need to make it an escaped string!  
- Classic/Hardcore: Fixed a bug with MOUNTS\_OnUpdate.  
- Added a setting to select the active soundpack  
- PTR: Dreamsurge coords update, vendor fixes  
- Title fix  
- Isles Ace title  
- Added new conditional to quest 58214  
    Quest is no longer required to be completed before unlocking Mechagnomes.  
- Added questnum required to quest 44240  
    Quest requires one of three possible quests completed, added questnumrequired to fix error.  
- Path updated for new Gnome run Icon  
- Updated paths for new cosmetic Icon  
- Path changed  for special sub catagory to new icon  
- Added conditional to quest 29219  
    Quest 29157 is no longer in game, cannot find definitive source on removal but data suggests removed in Legion.  
- Added missing breadcrumb flag  
    quest 45271 should be marked as breadcrumb but was not. Was generating inaccurate quest errors.  
- Removed unrelated source quest  
    SourceQuest 13995 is not related to this quest chain in any way that I can see.  
- Removing old illusion icon  
- Flightpath Icons updated  
    Upgrade Icon added and linked :D  
- Removed duplicated drops in wrong file.  
- Added the last missing first craft.  
- Added first craft for Glyph of the Shath'Yar.  
- Added a "BEFORE WRATH" preprocessor command to the zone-area-id fields for a number of instances.  
- note for darkal to mop rewards description  
- Attempt to filter out garbled statistics (blizzard bug) so they don't show up in tooltips and give people a fright (it's me, I'm people)  
- Retail: Whelp Daycare quest giver fix and doti hqts  
- Temp type condition to fix PrintPerf() in some situations (until I debug the original cause)  
- Added an improved & colorized source line method for tooltip information  
    Added back colored texts that disappeared from tooltips previously  
- TryColorizeName will default to group.name if name is not explicitly provided  
