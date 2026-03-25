#!/bin/sh

# insert USB related module
usbmod_exist=`mount | grep dwc_otg | wc -l`

if [ $usbmod_exist == 0 ]; then
insmod -q lm
insmod -q dwc_otg
fi

#turn on/off usb led
/sbin/usb_led_ctrl.sh
