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
echo currentDesktop=$((nextDesktop)) > ~/.local/state/currentDesktop.var

# determine which monitor is currently focused
# to figure out which order to switch workspaces
# this means focus is retained on the same monitor when workspaces change

workspaceId=$(hyprctl activeworkspace -j | jq '.id')
if [ $((workspaceId % 2)) -eq 0 ]
then
	if [ $(cat /sys/class/drm/card1-VGA-1/status) == "connected" ]
	then
		hyprctl dispatch "hl.dsp.focus({ workspace = $((nextDesktop*2-1)) })"
	fi

	hyprctl dispatch "hl.dsp.focus({ workspace = $((nextDesktop*2)) })"
else
	if [ $(cat /sys/class/drm/card1-VGA-1/status) == "connected" ]
	then
		hyprctl dispatch "hl.dsp.focus({ workspace = $((nextDesktop*2)) })"
	fi

	hyprctl dispatch "hl.dsp.focus({ workspace = $((nextDesktop*2-1)) })"
fi



exit 0
