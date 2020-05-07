#!/bin/bash

cat << DOC
# generate from template, do not edit

interface=$interface_ap
ssid=$ssid

# wireless conf
hw_mode=g
channel=11
driver=nl80211
max_num_sta=64

# auth
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP CCMP
rsn_pairwise=CCMP
wpa_passphrase=$password

# Enable 802.11n support
ieee80211n=1
DOC
