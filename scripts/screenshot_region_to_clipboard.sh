#!/bin/bash

FILENAME="/tmp/screenshot$(date +%F_%T).png"

maim -s $FILENAME

if [ -f $FILENAME ];
then
	echo $FILENAME
	xclip -selection clipboard -t image/png -i $FILENAME
	rm $FILENAME
fi
