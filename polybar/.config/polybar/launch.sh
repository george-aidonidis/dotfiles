#!/usr/bin/env bash

HAS_SECOND_SCREEN=$(xrandr | grep -w "DP1-8 connected")
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

if [ -n "$HAS_SECOND_SCREEN" ] || [ ! "$HAS_SECOND_SCREEN" = "" ]; then
  MONITOR="DP1-8" polybar --reload main &
  sleep 0.1
  MONITOR="eDP1" polybar --reload laptop &
  sleep 0.1
  MONITOR="DP1-1" polybar --reload port &
else
	polybar --reload fallback &
fi
