#!/usr/bin/env sh

HAS_SECOND_SCREEN=`xrandr | grep -w "DP1 connected"`
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
desktop=$(echo $DESKTOP_SESSION)

if [ -n "$HAS_SECOND_SCREEN" ] || [ ! "$HAS_SECOND_SCREEN" = "" ]; then
  MONITOR="DP1" polybar --reload main &
  sleep 0.1
  MONITOR="eDP1" polybar --reload laptop &
else
	polybar --reload fallback &
fi
