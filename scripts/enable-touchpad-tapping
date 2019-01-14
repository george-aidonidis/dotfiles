#!/usr/bin/env bash

TOUCHPAD_ID=$(xinput list|grep SynPS|grep id=|cut -f 2|cut -f 2 -d =)
echo "TOUCHPAD_ID"
echo $TOUCHPAD_ID

OPERATION_ID=$(xinput --list-props $TOUCHPAD_ID|grep 'Tapping Enabled ('|grep ' ('| awk '{print $4}'| grep -o -E '[0-9]+')
echo "OPERATION_ID"
echo $OPERATION_ID

STATUS=$(xinput --list-props $TOUCHPAD_ID|grep 'Tapping Enabled ('|cut -f 3)

echo "STATUS"
echo $STATUS
if [ $STATUS = 0 ]; then
	echo "Enablind touchpad tap"
	xinput set-prop $TOUCHPAD_ID $OPERATION_ID 1
fi
