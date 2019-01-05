#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
SCREEN=$($HOME/dotfiles/scripts/get-active-monitor.sh)
maim -g $SCREEN $FILENAME
xclip -selection clipboard -t image/png -i $FILENAME

notify-send -i "$FILENAME" "Saved active screen to clipboard"

