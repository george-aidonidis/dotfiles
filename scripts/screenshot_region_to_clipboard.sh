#!/bin/bash

FILENAME="/tmp/screenshot$(date +%F_%T).png"

maim -s $FILENAME

if [ -f $FILENAME ];
then
	echo $FILENAME
	notify-send "Image copied to clipboard" -t 1000
	xclip -selection clipboard -t image/png -i $FILENAME
	rm $FILENAME
fi
