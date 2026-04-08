# LootRollMover

## [v7.8](https://github.com/Xruptor/LootRollMover/tree/v7.8) (2026-02-23)
[Full Changelog](https://github.com/Xruptor/LootRollMover/compare/v7.7...v7.8) [Previous Releases](https://github.com/Xruptor/LootRollMover/releases)

- Positon Fixes and XAM Checks  
    * Added more position checks for Alert Frame anchors.  
    * Added more checks for XAM (XanAchievementMover) so that alert frames anchoring in LRM is disabled.  
    * Krowi's Achievement Filter addon uses a custom Alert Frame SubSystem, however LRM should be able to move it to the Alert Anchor if enabled.  Otherwise it will use xanAchievementMover anchor.  (Fixes #18)  
