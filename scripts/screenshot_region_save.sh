#!/bin/bash

FILENAME="$HOME/Pictures/screenshot$(date +%F_%T).png"

maim -s $FILENAME
