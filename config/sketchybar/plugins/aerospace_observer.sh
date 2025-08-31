#!/usr/bin/env bash

# This script should be called by aerospace when workspace changes
# It's configured in aerospace.toml via exec-on-workspace-change

# Update all workspace indicators
for i in {1..9}; do
    NAME="space.$i" bash ~/.config/sketchybar/plugins/aerospace.sh $i
done