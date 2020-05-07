#!/bin/sh

cat <<DOC
# generate from template, do not edit

interface=$interface_ap
except-interface=lo
bind-interfaces
listen-address=${addr%/*}
listen-address=${addr6%/*}
dhcp-range=$addr_range,1h
dhcp-range=$addr6_range,slaac,${addr6##*/},1h
dhcp-lease-max=64
dhcp-leasefile=/var/run/dnsmasq-$interface_ap.leases
no-hosts
cache-size=250
user=nobody
DOC
