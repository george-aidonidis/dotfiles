#!/bin/bash

# if [ $(rfkill list wwan | grep "Soft blocked: yes" | wc -l) -eq 1 ] ; then
# 	rfkill unblock wifi
# 	rfkill unblock wwan
# 	notify-send -t 1000 -- "Enabled wireless"
# else
# 	rfkill block wwan
# 	rfkill block wifi
# 	notify-send -t 1000 -- "Disabled wireless"
# fi

wifi_status=$(nmcli radio wifi)
if [ "$wifi_status" == "disabled" ]; then
	rfkill unblock wifi
	rfkill unblock wwan
	notify-send "Wireless enabled" -t 1000
else
	rfkill block wwan
	rfkill block wifi
	notify-send "Wireless disabled" -t 1000
fi
