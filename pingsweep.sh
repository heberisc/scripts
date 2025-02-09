#!/bin/bash

#Ping sweep a un segmento de red
start_ip=192.168.1.1
end_ip=192.168.1.254

for (( i = ${start_ip##*.}; i <= ${end_ip##*.}; i++ )); do
    ip="${start_ip%.*}.$i"
    ping -c 1 -W 1 "$ip" > /dev/null 2>&1 && echo "$ip"
    #ping -c 1 -W 1 "$ip" > /dev/null 2>&1 && echo "$ip is up" || echo "$ip is down"
done
