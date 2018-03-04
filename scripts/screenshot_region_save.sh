#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/screenshot$(date +%F_%T).png"

maim -s $FILENAME
notify-send "Saved region to $FILENAME"

