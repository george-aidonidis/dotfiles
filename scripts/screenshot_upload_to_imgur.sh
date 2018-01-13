#!/bin/bash

FILENAME="/tmp/imgur$(date +%F_%T).png"

maim -s $FILENAME; $HOME/dotfiles/scripts/imgur.sh $FILENAME

if [ -f $FILENAME ];
then
	rm $FILENAME
fi
