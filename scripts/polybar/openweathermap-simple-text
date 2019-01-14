#!/bin/sh
# From https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/openweathermap-simple/openweathermap-simple.sh

KEY="80736ccfeba5c5733b8ef98426a301a8"
CITY=""
UNITS="metric"
SYMBOL="°"

if [ ! -z $CITY ]; then
	weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=$KEY&id=$CITY&units=$UNITS")
	# weather=$(curl -sf "http://api.openweathermap.org/data/2.5/forecast?APPID=$KEY&id=$CITY&units=$UNITS&cnt=1")
else
	location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

	if [ ! -z "$location" ]; then
		location_lat="$(echo "$location" | jq '.location.lat')"
		location_lon="$(echo "$location" | jq '.location.lng')"

		weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
	fi
fi

if [ ! -z "$weather" ]; then
	weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)

	echo "$weather_temp$SYMBOL"
fi
