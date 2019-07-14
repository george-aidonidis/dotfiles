#!/bin/bash

SCREENS=$(xrandr | grep " connected " | awk '{ print$1 }')

ACTIVESCREENS=$(echo "$SCREENS" | wc -w)

getConnectedDisplay() {
	for item in $SCREENS
	do
    if [ "$item" != "eDP1" ]; then
      echo "$item"
    fi
	done
}

startPolybarStatic() {
  if [ "$ACTIVESCREENS" = "1" ]; then
    echo "1"
    MAINMONITOR="$SCREENS" polybar --reload main &
  elif [ "$ACTIVESCREENS" = "2" ]; then
    MONITOR="eDP1" polybar --reload laptop &
    sleep 0.1
    MAINMONITOR=getConnectedDisplay polybar --reload main &
  elif [ "$ACTIVESCREENS" = "3" ]; then
    MONITOR="eDP1" polybar --reload laptop &
    sleep 0.1
    MAINMONITOR="DP1-8" polybar --reload main &
    sleep 0.1
    SIDEMONITOR="DP1-1" polybar --reload main &
  else
    MAINMONITOR="eDP1" polybar --reload main &
  fi
}
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

startPolybarStatic

