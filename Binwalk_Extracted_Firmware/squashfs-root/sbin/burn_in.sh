#burn in test shell, add by Bruce Hsu

#sleep for awhile (wait for nvram_daemon ready)
sleep 3

#insert watch dog or dray test module
TST_MODE=`nvram_get 2860 test_mode`
if [ "$TST_MODE" == "1" ]; then
	TST_FIRST=`nvram_get 2860 test_first`
	if [ "$TST_FIRST" != "1" -a "$TST_FIRST" != "2" ]; then
		nvram_set 2860 test_first 1
		insmod -q dray_burn_in_test
		#set LED 
		gpio l 9 2 2 4000 0 4000	#ACT LED
		gpio l 12 2 2 4000 0 4000	#USB LED
	else
		if [ "$TST_FIRST" == "1" ]; then
			nvram_set 2860 test_first 2
		fi
		insmod -q dray_burn_in_test
		#set LED FAIL 
		gpio l 9 0 4000 0 1 4000	#ACT LED dark
		gpio l 12 2 2 4000 0 4000	#USB LED	
	fi
else
	insmod -q rt_timer
	gpio l 9 8 8 4000 0 4000	#ACT LED
fi

#turn on/off usb led
/sbin/usb_led_ctrl.sh