#!/usr/bin/env bash

LANG1="us"
LANG2="gr"

CURRENT_LANG=$(setxkbmap -query | grep "layout" | cut -f6 -d ' ')
sh $HOME/dotfiles/.xinitrc
if [ "$CURRENT_LANG" = $LANG1 ]; then
	setxkbmap -layout $LANG2
else
	setxkbmap -layout $LANG1
fi

