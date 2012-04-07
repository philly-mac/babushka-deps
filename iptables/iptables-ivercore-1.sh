#!/bin/bash

#Set variables
IPT=/usr/sbin/iptables

#Flush rules
$IPT -F
$IPT -X

#Default policies and define chains
$IPT -P OUTPUT DROP
$IPT -P INPUT DROP
$IPT -P FORWARD DROP

#Allow on selected ports
$IPT -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -p tcp --dport 19999 -j ACCEPT
$IPT -A INPUT -p tcp --dport 2812 -j ACCEPT
$IPT -A INPUT -p tcp --dport 22 -j ACCEPT
$IPT -A INPUT -p tcp --dport 2899 -j ACCEPT
$IPT -A INPUT -p tcp --dport 80 -j ACCEPT
$IPT -A INPUT 5 -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
$IPT -A INPUT -j DROP

rc.d save iptables