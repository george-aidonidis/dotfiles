#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot$(date +%Y-%m-%d_%H-%M-%S).png"

maim -i $(xdotool getactivewindow) $FILENAME
notify-send "Saved focused window to $FILENAME"

