#!/bin/sh
date > /tmp/onboot
ip_row=`ip addr | grep '10.16'`
while [ ! -n "$ip_row" ]
do
  ip_row=`ip addr | grep '10.16'`
  sleep 2
done
ping -c 1 10.16.153.108 >> /tmp/onboot
echo done >> /tmp/onboot

