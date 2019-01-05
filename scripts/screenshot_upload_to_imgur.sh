#!/bin/bash

FILENAME="$HOME/Pictures/screenshots/imgur-$(date +%Y-%m-%d-%H-%M-%S).png"

maim -s $FILENAME; $HOME/dotfiles/scripts/imgur.sh $FILENAME

