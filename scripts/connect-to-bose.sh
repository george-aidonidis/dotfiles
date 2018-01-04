#!/bin/bash

BOSE_MAC=`bt-device -l | grep Bose | awk '{print $4}' | tr -d '()'`
echo "Connecting to $BOSE_MAC"
# run the program bluez
echo -e "connect $BOSE_MAC\nquit" | bluetoothctl
