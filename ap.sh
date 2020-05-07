#!/bin/sh

source /etc/ap/ap.conf
export interface_wlan interface_ap ssid password
export addr addr_range addr6 addr6_range

# set -x
stop(){
    [ ! -z "$dnsmasq_pid" ] && kill $dnsmasq_pid
    [ ! -z "$hostapd_pid" ] && kill $hostapd_pid
    $iptables_added && sh /usr/share/ap/iptables-del.sh
    sleep 0.1 # do not quit too fast
    ip link show $interface_ap &>/dev/null && iw dev $interface_ap del
}

## check if exist
ip link show $interface_ap &>/dev/null && { echo "$interface_ap alreay exist!"; exit 1; }

## create virtual wireless interface
iw dev $interface_wlan interface add $interface_ap type managed || { echo "$interface_wlan not supported"; stop; exit 1; }
## setting address
ip addr add 10.42.0.1/24 dev $interface_ap
ip -6 addr add fd50:219f:54b4:d0d0::1/64 dev $interface_ap

## start hostapd
sh /usr/share/ap/hostapd-template.sh > /etc/ap/hostapd.conf
hostapd /etc/ap/hostapd.conf &
[ $? -eq 0 ] || { echo "hostapd start failed"; stop; exit 1; }
hostapd_pid=$!

## start dnsmasq
sh /usr/share/ap/dnsmasq-template.sh > /etc/ap/dnsmasq.conf
dnsmasq -k --conf-file=/etc/ap/dnsmasq.conf &
[ $? -eq 0 ] || { echo "dnsmasq start failed"; stop; exit 1; }
dnsmasq_pid=$!

## iptables
sh /usr/share/ap/iptables-add.sh && iptables_added=true


trap "stop; exit 0;" SIGKILL SIGTERM SIGINT SIGHUP SIGQUIT

for job in `jobs -p`
do
    wait $job
done
