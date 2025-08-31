#!/usr/bin/env bash

# Toggle between tiles and accordion layouts
# Since we can't reliably detect the current layout, we'll just toggle
# and keep track via a state file

STATE_FILE="/tmp/aerospace_layout_state"

if [ -f "$STATE_FILE" ] && [ "$(cat $STATE_FILE)" = "accordion" ]; then
    aerospace layout tiles
    echo "tiles" > $STATE_FILE
    ICON="⊞"
    LABEL="Tiles"
else
    aerospace layout accordion
    echo "accordion" > $STATE_FILE
    ICON="≡"
    LABEL="Accordion"
fi

# Update the indicator directly
sketchybar --set layout_indicator \
    icon="$ICON" \
    label="$LABEL"