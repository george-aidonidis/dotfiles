#!/bin/bash
# Resets bluetooth device by:
# - Setting output to default card
# - Switching sound profile on bluetooth (off --> ad2p_sink)
# - Setting output to bluetooth device

DEFAULTSINK=`pactl list sinks short | grep alsa | awk '{print $2}'`
BLUEZSINK=`pactl list sinks short | grep bluez | awk '{print $2}'`
BLUEZCARD=`pactl list cards short | grep bluez | awk '{print $2}'`

pacmd set-default-sink $DEFAULTSINK
echo "switched default sink to $DEFAULTSINK"

pactl set-card-profile $BLUEZCARD off
echo "switched card $BLUEZCARD to off"

pactl set-card-profile $BLUEZCARD a2dp_sink
echo "switched card $BLUEZCARD to ad2p_sink"

pacmd set-default-sink $BLUEZSINK
echo "switched default sink to $BLUEZSINK"
