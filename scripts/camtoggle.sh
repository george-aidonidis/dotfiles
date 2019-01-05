#!/bin/bash

screen_width=$(xdpyinfo | grep dimensions | awk '{print $2;}' | cut -d 'x' -f1)
screen_height=$(xdpyinfo | grep dimensions | awk '{print $2;}' | cut -d 'x' -f2)

width=400
height=225
x_start=$(($screen_width-$width))
y_start=$(($screen_height-$height))
echo $x_start
echo $y_start
pkill -f /dev/video || mplayer -vf mirror -geometry $x_start:$y_start -tv driver=v4l2:gain=1:width=$width:height=$height:device=/dev/video2:fps=10:outfmt=rgb16 tv://
