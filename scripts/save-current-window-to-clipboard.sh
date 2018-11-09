#!/bin/bash

FILENAME="/tmp/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

maim -i $(xdotool getactivewindow) $FILENAME

if [ -f $FILENAME ];
then
	echo $FILENAME
	notify-send "Screenshot of focused window copied to clipboard"
	xclip -selection clipboard -t image/png -i $FILENAME
	rm $FILENAME
fi
