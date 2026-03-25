#!/bin/sh

# Copyright (C) 2009 Draytek

# we check if Lev=01 and Port=00 is connect, we light up the LED
dev_num=$(grep -c Lev=01.*Port=00 /proc/bus/usb/devices)
if [ "$dev_num" = "1" ]; then
        # USB LED on
        gpio l 12 4000 0 1 0 4000	
else
		#check test mode
		TST_MODE=`nvram_get 2860 test_mode`
		if [ "$TST_MODE" == "1" ]; then
			gpio l 12 2 2 4000 0 4000	#USB LED
		else
			gpio l 12 0 4000 0 1 4000
		fi
fi
