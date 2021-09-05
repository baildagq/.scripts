#!/bin/bash

# wpa_passphrase ssid password > network.conf
sudo ip link set wlp4s0 up
sudo wpa_supplicant -c network.conf -i wlp4s0 &
sudo dhcpcd&
