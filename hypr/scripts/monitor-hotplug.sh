#!/bin/bash
monitor_count=$(hyprctl monitors -j | jq length)

if [ "$monitor_count" -gt 1 ]; then
    # Get port names - add validation
    dell_27=$(hyprctl monitors -j | jq -r '.[] |  select(.description | contains("DELL U2723QE")) | .name')
    dell_24=$(hyprctl monitors -j | jq -r '.[] | select(.description | contains("DELL U2421E")) | .name')
    framework_13=$(hyprctl monitors -j | jq -r '.[] | select(.description | contains("BOE NE135A1M-NY1")) | .name')

    # Only execute if all monitors found
    if [ -n "$framework_13" ] && [ -n "$dell_27" ] && [ -n "$dell_24" ]; then
        hyprctl keyword monitor $framework_13,2880x1920@120,0x0,3
        hyprctl keyword monitor $dell_27,3840x2160@60,auto-right,2
        hyprctl keyword monitor $dell_24,1920x1200@60,auto-right,1.2,transform,1
    fi
else
    # Solo mode - use static name, not variable
    hyprctl keyword monitor eDP-1,2880x1920@120,0x0,2
fi
