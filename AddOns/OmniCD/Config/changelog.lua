local E, L, C = select(2, ...):unpack()

C.changelog = [=[
v2.5.1
    Bug Fixes
        General: 'Show Player' will correctly update on zone change.
        Spells: 'Clear All' will correctly clear all enabled spells instead of setting it back to default.
        Fixed an issue that caused cross-addon communication to fail.
    Icons
        All borders have been reverted back to grow inward.
        Default offset/padding values have changed accordingly.
    Localization Updates
        ruRU


v2.5.0
    TL;DR
        Shadowlands release update.
        New Interrupt and Raid-CD bars.
        Still lighweight with minimal CPU usage.

    Feature Updates
        Ex Bars: New Interrupt and Raid-CD bars with optional progress timers added.
        Highlights: Option to disable animation added.
        Spell Editor: Spell can be spec-default while being a talent for others.
        Spell Editor: Non-Class spells can now select any priority type.
        Option settings are now fully customizable per instance zone.
        Synchronizing CD reduction by spending resources is enabled for Rogues in Arenas only.
        All frames are now created on demand and recycled.
        Revamped spell detection for slight efficiency.
        Better handling of large outdoor raids where members are constantly changing.
        Removed all non-essential process in the background while not actively tracking CDs.
    Spell Updates
        Class abilities updated for Shadowlands. (700+ spells)
        New Covenant abilities added.
        New PvP/PvE Trinkets added.
    Cooldown Modifiers
        Class modifiers updated for Shadowlands.
        New Runeforge-Legendaries, Covenants, and Soulbind-Conduits added.
        Cooldown recovery-rate added for Heartstop Aura, Thundercharge, Blessing of Autumn. and Benevolent Fae.
        Chance to proc and free charge mechanics were excluded. Everything else has been implemented.
    Removed Features
        Icons: 'Relative Scale' option.
        Azerite, Essence, and Corruption effects.
    Known Issues (from Blizzard)
        Aspirant's Medallion used while under the effect of Thundercharge results in slower CD recovery when it ends.
        Aspirant's Medallion used while under the effect of Blessing of Autumn results in slower CD recovery when it ends.
        Thundercharge CD recovery rate doubling when casted on player. (temp fix applied)
        Shifting Power's CD reduction not applying to Alter time for Arcane Mage. (temp fix applied)


]=]
