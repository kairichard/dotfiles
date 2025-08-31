# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a SketchyBar configuration for macOS, part of a larger dotfiles repository managed with [lace](https://github.com/kairichard/lace). SketchyBar is a highly customizable macOS status bar replacement.

## Key Commands

### Testing Changes
After modifying the configuration or plugins:
```bash
# Reload SketchyBar configuration
sketchybar --reload

# Check SketchyBar status
sketchybar --query

# Test a specific plugin manually
bash plugins/[plugin_name].sh
```

### Debugging
```bash
# View SketchyBar logs
tail -f /tmp/sketchybar_*.log

# Test plugin output directly
NAME="test_item" SENDER="routine" bash plugins/[plugin_name].sh
```

## Architecture

### Configuration Structure
- **sketchybarrc**: Main configuration file that sets up the bar appearance, default item properties, and loads all plugins
- **colors.sh**: Color scheme definitions (multiple themes available but mostly commented out)
- **plugins/**: Individual scripts for each bar item, executed by SketchyBar based on events or update frequencies

### Plugin Architecture
Plugins interact with SketchyBar through environment variables:
- `$NAME`: The item identifier calling the script
- `$SENDER`: Event type triggering the script (e.g., "routine", "volume_change", "forced")
- `$INFO`: Event-specific data passed from SketchyBar

Plugins update their display using: `sketchybar --set "$NAME" property=value`

### Common Plugin Patterns
1. **System monitoring**: CPU, memory, battery status using system commands (pmset, ps, etc.)
2. **Application integration**: Spotify, front app detection using AppleScript
3. **Event handlers**: Volume changes, space switching, microphone toggling
4. **API integrations**: Custom plugins like cursor_spending.sh that fetch external data

### External Dependencies
- **Required**: sketchybar binary, Hack Nerd Font (for icons)
- **System tools**: osascript, pmset, sqlite3, curl
- **Optional**: Spotify (for music indicator), Cursor (for spending tracker)

## Important Considerations

- All plugin scripts must be executable (`chmod +x`)
- Plugins run frequently, so keep them lightweight to avoid performance impact
- The bar uses Hack Nerd Font for icons - ensure proper font rendering when adding new icons
- Color values use ARGB format (e.g., 0xffeceff4)
- Update frequencies are in seconds; be mindful of API rate limits for external services