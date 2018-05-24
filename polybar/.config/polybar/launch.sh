#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
desktop=$(echo $DESKTOP_SESSION)

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo $m
		# MONITOR=$m polybar --reload example &
	done
  MONITOR="DP-1" polybar --reload example &
  sleep 1
  MONITOR="eDP1" polybar --reload example &
else
	polybar --reload example &
fi

echo "Bars launched..."
