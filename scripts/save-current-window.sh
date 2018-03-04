#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot$(date +%F_%T).png"

maim -i $(xdotool getactivewindow) $FILENAME
notify-send "Saved focused window to $FILENAME"

