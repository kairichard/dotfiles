#!/usr/bin/env bash

# Get current workspace information
FOCUSED=$(aerospace list-workspaces --focused)
ACTIVE_WORKSPACES=$(aerospace list-workspaces --all)

# Check if this workspace exists
if ! echo "$ACTIVE_WORKSPACES" | grep -q "^$1$"; then
    # Workspace doesn't exist, hide it
    sketchybar --set $NAME drawing=off
    exit 0
fi

# Get window count for this workspace
WINDOWS=$(aerospace list-windows --workspace "$1" 2>/dev/null | wc -l | tr -d ' ')

# Only show workspace if it has windows or is currently focused
if [ "$WINDOWS" -eq 0 ] && [ "$1" != "$FOCUSED" ]; then
    sketchybar --set $NAME drawing=off
else
    sketchybar --set $NAME drawing=on
    
    # Update the workspace indicator styling
    if [ "$1" = "$FOCUSED" ]; then
        sketchybar --set $NAME \
            background.drawing=on \
            background.color=0xff57627A \
            label.color=0xffeceff4 \
            icon.color=0xffeceff4
    else
        sketchybar --set $NAME \
            background.drawing=off \
            label.color=0xffeceff4 \
            icon.color=0xffeceff4
    fi
    
    # Update label to show window count if there are windows
    if [ "$WINDOWS" -gt 0 ]; then
        sketchybar --set $NAME label="($WINDOWS)"
    else
        sketchybar --set $NAME label=""
    fi
fi