#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot$(date +%Y-%m-%d_%H-%M-%S).png"

maim -i $(xdotool getactivewindow) $FILENAME
xclip -selection clipboard -t image/png -i $FILENAME

notify-send "Saved focused window to clipboard and $FILENAME"

