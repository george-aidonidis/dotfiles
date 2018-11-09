#!/bin/bash

FILENAME="/tmp/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

maim -s $FILENAME

if [ -f $FILENAME ];
then
	echo $FILENAME
	notify-send "Image copied to clipboard" -t 1000
	xclip -selection clipboard -t image/png -i $FILENAME
	rm $FILENAME
fi
