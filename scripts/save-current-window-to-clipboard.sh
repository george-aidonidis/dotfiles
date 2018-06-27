#!/bin/bash

FILENAME="/tmp/screenshot$(date +%F_%T).png"

maim -i $(xdotool getactivewindow) $FILENAME

if [ -f $FILENAME ];
then
	echo $FILENAME
	notify-send "Screenshot of focused window copied to clipboard"
	xclip -selection clipboard -t image/png -i $FILENAME
	rm $FILENAME
fi
