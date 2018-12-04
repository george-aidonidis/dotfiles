#!/bin/sh

updates_arch=$(checkupdates 2>/dev/null | wc -l)

if [ $? -eq 1 ]; then
	exit 0;
fi

if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
	updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
	echo "$updates"
else
	echo ""
fi
