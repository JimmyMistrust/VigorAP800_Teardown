#!/bin/sh
#call-schedule <action> <minute> <hour> <day> <mouth> <year>

date1="$6-$5-$4 $3:$2:00"
datenow="$(date +%s)"
dateset="$(date -d "$date1" +%s)"

PROTO=`nvram_get 2860 wanConnectionMode`
CHK_3G=`ifconfig | grep ppp0`

check_radius()
{
    killall -q rt2860apd

	IFS=";"
	export IFS;
	string=`nvram_get 2860 AuthMode`
	string2=`nvram_get 2860 IEEE8021X`

    # WPA  WPA2  WPA1WPA2
    for word in $string; 
    do
        if [ "$word" = "WPA" -o "$word" = "WPA2" -o "$word" = "WPA1WPA2" ]; then
            rt2860apd
            return # Due to WPA/WPA2/WPA1WPA2 802.1x is selected.
        fi
    done
    # IEEE8021X
    for word in $string2; 
    do
        if [ "$word" = "1" ]; then
            rt2860apd
            return # WEP 802.1x
        fi
    done
}

if [ $datenow -ge $dateset ] ;then
	case "$1" in
	4)	echo "[schedule] \"Auto reboot\" action"
		#Auto reboot schedule
		sleep 10
		reboot
		;;
	6)	echo "[schedule] \"Wi-Fi UP\""
		nvram_set RadioOff 0
        killall -34 goahead
        killall -SIGUSR1 tr069_client
		internet.sh
        check_radius
		;;
	7)	echo "[schedule] \"Wi-Fi DOWN\""
		nvram_set RadioOff 1
        killall -34 goahead
        killall -SIGUSR1 tr069_client
		internet.sh
		;;
	esac
fi