#!/bin/bash

#scanning WiFi networks
echo "Scanning WiFi networks..."
sudo iwlist wlan0 scan | grep ESSID

#prompt user to enter the SSID
echo "Please enter the SSID of the WiFi network you want to connect to: "
read ssid

#prompt user to enter the password
echo "Please enter the password for the WiFi network: "
read -s password

#generate WPA configuration
wpa_passphrase $ssid $password >> /etc/wpa_supplicant/wpa_supplicant.conf

#reconfigure network interface
wpa_cli -i wlan0 reconfigure

#waiting for IP
echo "Waiting for IP..."
sleep 10

#print the IP address
ip=$(ifconfig wlan0 | grep 'inet ' | awk '{print $2}')
echo "The IP address for wlan0 is: $ip"
