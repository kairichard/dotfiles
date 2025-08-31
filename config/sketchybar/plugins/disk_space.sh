#!/usr/bin/env bash

# Get disk usage for main disk using diskutil for accurate APFS container info
MAIN_INFO=$(diskutil info disk3s1s1 2>/dev/null)
if [ -n "$MAIN_INFO" ]; then
    MAIN_TOTAL=$(echo "$MAIN_INFO" | grep "Container Total Space" | awk '{print $4}' | sed 's/\..*$//')
    MAIN_FREE=$(echo "$MAIN_INFO" | grep "Container Free Space" | awk '{print $4}' | sed 's/\..*$//')
    if [ -n "$MAIN_TOTAL" ] && [ -n "$MAIN_FREE" ]; then
        MAIN_USED=$((MAIN_TOTAL - MAIN_FREE))
        MAIN_USAGE=$((MAIN_USED * 100 / MAIN_TOTAL))
    else
        # Fallback to df if diskutil fails
        MAIN_USAGE=$(df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//')
    fi
else
    # Fallback to df
    MAIN_USAGE=$(df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//')
fi

# Check if T9 volume exists and get usage
if [ -d "/Volumes/T9" ]; then
    T9_USAGE=$(df -h /Volumes/T9 | tail -n 1 | awk '{print $5}' | sed 's/%//')
    T9_AVAILABLE=$(df -h /Volumes/T9 | tail -n 1 | awk '{print $4}')
    T9_LABEL=" | T9: ${T9_USAGE}%"
    
    # Determine T9 color using Nord theme
    if [ "$T9_USAGE" -gt 85 ]; then
        T9_COLOR=0xffbf616a  # Nord red
    elif [ "$T9_USAGE" -gt 70 ]; then
        T9_COLOR=0xffebcb8b  # Nord yellow
    else
        T9_COLOR=0xffa3be8c  # Nord green
    fi
else
    T9_LABEL=""
    T9_COLOR=0xffeceff4
fi

# Determine main disk color using Nord theme
if [ "$MAIN_USAGE" -gt 85 ]; then
    MAIN_COLOR=0xffbf616a  # Nord red
    ICON_COLOR=0xffbf616a
elif [ "$MAIN_USAGE" -gt 70 ]; then
    MAIN_COLOR=0xffebcb8b  # Nord yellow
    ICON_COLOR=0xffebcb8b
else
    MAIN_COLOR=0xffa3be8c  # Nord green
    ICON_COLOR=0xffa3be8c
fi

# Update the bar
sketchybar --set "$NAME" \
    icon="󰋊" \
    icon.color=$ICON_COLOR \
    label="Main: ${MAIN_USAGE}%${T9_LABEL}" \
    label.color=0xffeceff4 \
    drawing=on