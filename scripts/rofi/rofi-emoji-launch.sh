#!/bin/sh

CURRENT_WINDOW=`xdotool getwindowfocus`

xdotool windowfocus $CURRENT_WINDOW
opt=$($HOME/dotfiles/scripts/rofi/rofi-emoji.sh | rofi -width 25 -lines 16 -dmenu -i -p ' 😀')
return_code=$?

if [ $return_code -ne 1 ]
then
  smiley=$(echo $opt | cut -d' ' -f1)
  echo -n "$smiley" | xsel -bi
	xdotool key --clearmodifiers Shift+Insert; wait
  exit 0
fi
