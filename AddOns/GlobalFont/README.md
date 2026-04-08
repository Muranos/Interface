# GlobalFont

A simple, lightweight World of Warcraft addon that does one thing and does it well: allows you to change the global system font used across all WoW UI elements.

## Features

- 🎨 Preview fonts in their actual style before applying
- 💾 Settings persist across game sessions and reloads
- 🔌 Supports LibSharedMedia fonts (if installed)
- ⚡ Simple and lightweight - no bloat
- 🎯 Easy-to-use interface

## Installation

### Manual Installation

1. Download the latest release from this repository
2. Extract the `GlobalFont` folder
3. Place it in your WoW AddOns directory:
   - **Windows**: `C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\`
   - **Mac**: `/Applications/World of Warcraft/_retail_/Interface/AddOns/`
4. Restart World of Warcraft or reload your UI (`/reload`)

### CurseForge Installation

1. Install via the CurseForge app or download from [CurseForge](https://www.curseforge.com/wow/addons/globalfont)
2. The addon will be automatically placed in the correct directory

### Wago.io Installation

1. Install via the Wago app or download from [Wago.io](https://addons.wago.io/addons/j6jz1W6R)
2. The addon will be automatically placed in the correct directory

## Usage

### Opening the Font Selector

Use either of these slash commands in-game:
- `/gf`
- `/globalfont`

### Changing Your Font

1. Type `/gf` to open the font selector window
2. Browse through the available fonts - each font name is displayed in its own style so you can preview it
3. Click on a font to select it (it will highlight in green)
4. Click the "Apply Font" button at the bottom
5. For the complete effect, reload your UI with `/reload`

### Reverting to Default

Simply select "Friz Quadrata TT" (the default WoW font) and apply it, then reload.

## Compatibility

- **WoW Version**: Retail (The War Within - 11.0.2+)
- **Dependencies**: None (works standalone)
- **Optional Dependencies**: 
  - LibSharedMedia-3.0 (for additional font options)

## LibSharedMedia Support

If you have other addons that use LibSharedMedia-3.0, GlobalFont will automatically detect and display any fonts registered with SharedMedia, giving you access to a much larger font library.

## Frequently Asked Questions

**Q: Do I need to reload after applying a font?**  
A: For best results, yes. Type `/reload` to fully apply the font to all UI elements.

**Q: Will this affect my other addons?**  
A: GlobalFont changes the system fonts that WoW uses, which affects both Blizzard UI and most addon frames that use default fonts. Some addons may have their own font settings that override this.

**Q: Can I use custom fonts not in the list?**  
A: Yes! Install them via LibSharedMedia-3.0 compatible addons (like SharedMedia or SharedMediaAdditionalFonts), and they'll automatically appear in GlobalFont's list.

**Q: Does this work in Classic/Wrath/Cataclysm?**  
A: Currently only tested and supported for Retail. Classic versions may be added in the future.

## Support

If you encounter any issues or have feature requests:
- Open an issue on [GitHub](https://github.com/burntorangejedi/GlobalFont)
- Report bugs with as much detail as possible (error messages, steps to reproduce, etc.)

## License

This addon is released under the MIT License. Feel free to modify and distribute as needed.

## Credits

Created with ❤️ for the WoW community by players who just wanted a simple font changer.

Special thanks to the LibSharedMedia team for their excellent library.
