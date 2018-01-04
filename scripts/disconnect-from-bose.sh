#!/bin/bash

BOSE_MAC=`bt-device -l | grep Bose | awk '{print $4}' | tr -d '()'`
echo "Disconnecting from $BOSE_MAC"
# run the program bluez
echo -e "disconnect $BOSE_MAC\nquit" | bluetoothctl

