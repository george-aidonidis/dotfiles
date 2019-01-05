#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"

maim -i $(xdotool getactivewindow) $FILENAME

notify-send -i "$FILENAME" "Saved focused window to clipboard"
xclip -selection clipboard -t image/png -i $FILENAME