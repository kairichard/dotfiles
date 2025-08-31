#!/usr/bin/env bash

# Initialize status variables
TAILSCALE_STATUS=""
OVPN_STATUS=""
VPN_LABEL=""
VPN_COLOR=0xffbf616a  # Nord red (default for disconnected)

# Check Tailscale status
if /usr/local/bin/tailscale status &>/dev/null; then
    # Check if actually connected (not just installed)
    if /usr/local/bin/tailscale status | grep -q "100\."; then
        TAILSCALE_STATUS="TS"
        VPN_COLOR=0xffa3be8c  # Nord green
    fi
fi

# Check OpenVPN status - look for tun/utun with actual IPv4 address
# OpenVPN creates interfaces with IPv4 addresses, not just IPv6
OVPN_CONNECTED=false
for interface in $(ifconfig | grep -E "^(tun[0-9]|utun[1-9])" | cut -d: -f1); do
    # Check if interface has an IPv4 address (not 100.x which is Tailscale)
    if ifconfig "$interface" 2>/dev/null | grep -E "inet [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | grep -v "inet 100\." >/dev/null; then
        OVPN_CONNECTED=true
        break
    fi
done

if [ "$OVPN_CONNECTED" = true ]; then
    # Interface exists with IP, but check if it's actually working by pinging internal host
    if ping -c 1 -W 1 10.111.0.113 &>/dev/null; then
        OVPN_STATUS="OVPN"
        VPN_COLOR=0xffa3be8c  # Nord green
    else
        # Interface exists but can't reach internal network
        OVPN_STATUS="OVPN?"
        VPN_COLOR=0xffebcb8b  # Nord yellow - warning state
    fi
fi

# Build label based on active VPNs
if [ -n "$TAILSCALE_STATUS" ] && [ -n "$OVPN_STATUS" ]; then
    if [ "$OVPN_STATUS" = "OVPN?" ]; then
        VPN_LABEL="TS+OVPN!"
        VPN_COLOR=0xffebcb8b  # Nord yellow - OVPN needs attention
    else
        VPN_LABEL="TS+OVPN"
        VPN_COLOR=0xffa3be8c  # Nord green
    fi
elif [ -n "$TAILSCALE_STATUS" ]; then
    VPN_LABEL="Tailscale"
    VPN_COLOR=0xff88c0d0  # Nord cyan for Tailscale only
elif [ -n "$OVPN_STATUS" ]; then
    if [ "$OVPN_STATUS" = "OVPN?" ]; then
        VPN_LABEL="OVPN!"
        VPN_COLOR=0xffebcb8b  # Nord yellow - needs attention
    else
        VPN_LABEL="OpenVPN"
        VPN_COLOR=0xffa3be8c  # Nord green for OpenVPN
    fi
else
    VPN_LABEL="No VPN"
    VPN_COLOR=0xffbf616a  # Nord red
fi

# Update SketchyBar
sketchybar --set "$NAME" \
    icon="󰒄" \
    icon.color=$VPN_COLOR \
    label="$VPN_LABEL" \
    label.color=$VPN_COLOR \
    drawing=on