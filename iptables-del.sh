#!/bin/sh
iptables  -t nat -D POSTROUTING -s 10.42.0.0/24  -j MASQUERADE 
ip6tables -t nat -D POSTROUTING -s fd50:219f:54b4:d0d0::/64 -j MASQUERADE
