#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"

maim -s $FILENAME

notify-send -i $FILENAME "Image copied to clipboard"
xclip -selection clipboard -t image/png -i $FILENAME
