#!/bin/bash

. ~/.local/state/currentDesktop.var
currentDesktop=${currentDesktop}

if [ ! $1 -eq 1 ] && [ ! $1 -eq -1 ]
then
        exit 1
fi

if [ $currentDesktop -eq 1 ] && [ $1 -eq -1 ]
then
	exit 1
fi

if [ $currentDesktop -eq 4 ] && [ $1 -eq 1 ]
then
	exit 1
fi

nextDesktop=$((currentDesktop+$1))

# determine which monitor is currently focused
# to figure out which order to switch workspaces
# this means focus is retained on the same monitor when workspaces change

workspaceId=$(hyprctl activeworkspace -j | jq '.id')
if [ $((workspaceId % 2)) -eq 0 ]
then
	if [ $(cat /sys/class/drm/card1-HDMI-A-2/status) == "connected" ]
	then
		hyprctl dispatch workspace $((nextDesktop*2-1))
	fi

	hyprctl dispatch workspace $((nextDesktop*2))
else
	if [ $(cat /sys/class/drm/card1-HDMI-A-2/status) == "connected" ]
	then
		hyprctl dispatch workspace $((nextDesktop*2))
	fi

	hyprctl dispatch workspace $((nextDesktop*2-1))
fi


echo currentDesktop=$((nextDesktop)) > ~/.local/state/currentDesktop.var

exit 0
