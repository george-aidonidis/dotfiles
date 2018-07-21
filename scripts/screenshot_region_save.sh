#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot$(date +%Y-%m-%d_%H-%M-%S).png"

maim -s $FILENAME
notify-send "Saved region to $FILENAME"

