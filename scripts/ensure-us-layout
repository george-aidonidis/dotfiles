#!/bin/sh
CURRENT=$(xkblayout-state print %s)

if [ $CURRENT != "us" ]
then
	xkb-switch -n
	QT_AUTO_SCREEN_SCALE_FACTOR=0 $1
	xkb-switch -n
	exit 0
else
	QT_AUTO_SCREEN_SCALE_FACTOR=0 $1
	exit 0
fi
