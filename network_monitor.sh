#!/bin/bash

#Specify network interface
IFACE="wlan0"

#Get received and transmitted bytes
RX_PREV=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

sleep 1

RX_NEXT=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_NEXT=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

#Calculate received and transmitted bytes per second
RX_BPS=$(expr $RX_NEXT - $RX_PREV)
TX_BPS=$(expr $TX_NEXT - $TX_PREV)

echo "Received bytes per second: $RX_BPS"
echo "Transmitted bytes per second: $TX_BPS"
