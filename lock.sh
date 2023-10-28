#!/bin/sh

swaylock \
	--ignore-empty-password \
	--image='~/.wallpapers/image.jpg' \
	--clock \
	--timestr '%I:%M %p'\
	--datestr '' \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--ring-color 595959 \
	--ring-wrong-color e95f4a \
	--ring-ver-color 6fb8db \
	--ring-clear-color fed070 \
	--key-hl-color 33ccff \
	--text-color=ffffff \
	--text-caps-lock-color=ffffff \
	--text-ver-color=ffffff \
	--text-clear-color=ffffff \
	--text-wrong-color=ffffff \
	--line-color 00000000 \
	--inside-color 00000088 \
	--inside-wrong-color 00000088 \
	--inside-ver-color 00000088 \
	--inside-clear-color 00000088 \
	--separator-color 00000000 \
	--fade-in 0.2
