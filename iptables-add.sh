#!/bin/sh
iptables  -t nat -A POSTROUTING -s 10.42.0.0/24  -j MASQUERADE 
ip6tables -t nat -A POSTROUTING -s fd50:219f:54b4:d0d0::/64 -j MASQUERADE
