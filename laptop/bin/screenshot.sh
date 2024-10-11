#!/bin/bash

hyprpicker -r -n -z & hyprpicker_pid=$!

grimblast copy area
kill "$hyprpicker_pid"
