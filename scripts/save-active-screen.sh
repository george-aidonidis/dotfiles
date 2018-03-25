#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot$(date +%F_%T).png"
SCREEN=$($HOME/dotfiles/scripts/get-active-monitor.sh)
maim -g $SCREEN $FILENAME
xclip -selection clipboard -t image/png -i $FILENAME

notify-send "Saved active screen to clipboard and $FILENAME"
