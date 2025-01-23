#!/bin/bash

state=$1
if [ "$state" == "open" ]; then
    hyprctl keyword monitor "HDMI-A-2,preferred@highrr,1920x0,1"
elif [ "$state" == "closed" ]; then
    hyprctl keyword monitor "HDMI-A-2,disable"
    systemctl suspend
fi
