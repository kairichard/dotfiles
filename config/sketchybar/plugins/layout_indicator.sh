#!/usr/bin/env bash

# Get the current workspace and its layout
# Aerospace doesn't have a direct command to get layout, so we check the tree structure
WORKSPACE=$(aerospace list-workspaces --focused)

# Check if workspace is using accordion layout by looking at the tree structure
# In accordion layout, windows are stacked rather than tiled
# For now, we'll default to tiles since aerospace defaults to tiles
# This can be enhanced when aerospace provides better layout query API

# Check state file to determine current layout
STATE_FILE="/tmp/aerospace_layout_state"

if [ -f "$STATE_FILE" ] && [ "$(cat $STATE_FILE)" = "accordion" ]; then
    ICON="≡"
    LABEL="Accordion"
else
    ICON="⊞"
    LABEL="Tiles"
fi

# Update the bar
sketchybar --set $NAME \
    icon="$ICON" \
    label="$LABEL" \
    icon.color=0xffeceff4 \
    label.color=0xffeceff4 \
    drawing=on