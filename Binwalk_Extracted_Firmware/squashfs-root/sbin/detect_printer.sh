#!/bin/sh
#

# find whether printer exists
temp=`cat /proc/bus/usb/devices | grep usblp`
if [ "$temp" != "" ]; then
	echo 1 > /var/printerExist
else
	echo 0 > /var/printerExist
fi
