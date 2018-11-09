#!/bin/bash

FILENAME="/tmp/imgur-$(date +%Y-%m-%d_%H-%M-%S).png"

maim -s $FILENAME; $HOME/dotfiles/scripts/imgur.sh $FILENAME

if [ -f $FILENAME ];
then
	rm $FILENAME
fi
