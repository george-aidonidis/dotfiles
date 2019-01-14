#!/usr/bin/env bash

# Require `scrot`, `imagemagick`, `i3lock`
icon="$HOME/i3/.config/i3/images/key-lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"

if [[ -f "$icon" ]]
then
  # placement x/y
  PX=0
  PY=0
  # lockscreen image info
  R=$(file "$icon" | grep -o '[0-9]* x [0-9]*')
  RX=$(echo $R | cut -d' ' -f 1)
  RY=$(echo $R | cut -d' ' -f 3)

  SR=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
  for RES in $SR
  do
    # monitor position/offset
    SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
    SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
    SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
    SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
    PX=$(($SROX + $SRX/2 - $RX/2))
    PY=$(($SROY + $SRY/2 - $RY/2))

    convert "$tmpbg" "$icon" -geometry +$PX+$PY -composite -matte "$tmpbg"
    echo "done"
  done
fi

i3lock -e -u -n -i "$tmpbg"

# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
# i3lock -u -i "$tmpbg"
