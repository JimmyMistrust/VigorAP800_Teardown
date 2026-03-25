#!/bin/sh
#
# $Id: ntp.sh,v 1.4 2008-01-21 08:39:58 yy Exp $
#
# usage: ntp.sh
#

srv=`nvram_get 2860 NTPServerIP`
sync=`nvram_get 2860 NTPSync`
tz=`nvram_get 2860 TZ`
daylight=`nvram_get 2860 DaylightSaving`


killall -q ntpclient

if [ "$srv" = "" ]; then
	exit 0
fi

if [ "$tz" = "" ]; then
	tz="UCT_000"
fi

#debug
#echo "serv=$srv"
#echo "sync=$sync"
#echo "tz=$tz"

echo $tz > /etc/tmpTZ
sed -e 's#.*_\(-*\)0*\(.*\)#GMT-\1\2#' /etc/tmpTZ > /etc/tmpTZ2
sed -e 's#\(.*\)--\(.*\)#\1\2#' /etc/tmpTZ2 > /etc/TZ

ntpclient -s -c 0 -h $srv -i $sync &

#added by james.lin to set daylight saving for following timezones
if [ "$daylight" = 1 ]; then
	case "$tz" in
		NAS_-09) #Alaska
			echo "AKST9AKDT,M3.2.0,M11.1.0" > /etc/TZ
		;;
		PST_-08) #Pacific Time
			echo "PST8PDT,M3.2.0,M11.1.0" > /etc/TZ
		;;
		MST_-07) #Mountain Time
			echo "MST7MDT,M3.2.0,M11.1.0" > /etc/TZ
		;;
		CST_-06) #Central Time
			echo "CST6CDT,M3.2.0,M11.1.0" > /etc/TZ
		;;
		EST_-05) #Eastern Time
			echo "EST5EDT,M3.2.0,M11.1.0" > /etc/TZ
		;;
		AST_-04) #Atlantic Time, Brazil West
			echo "AST4ADT,M3.2.0,M11.1.0" > /etc/TZ
		;;
		GMT_000) #England, Portugal
			echo "WET0WEST,M3.5.0/1,M10.5.0" > /etc/TZ
		;;
		GM1_000) #Greenwich Mean Time : Dublin
			echo "GMT0IST,M3.5.0/1,M10.5.0" > /etc/TZ 
		;;
		#Spain, France, Switzerland, Italy, Germany, Netherlands, Belgium, Sweden, Denmark, Lithuania, Poland
		#Czech Republic, Austria, Slovakia, Hungary, Slovenia, Croatia, Bosnia Herzegovina
		MET_001|MEZ_001|ME1_001|ME2_001|ME3_001) 
			echo "CET-1CEST,M3.5.0,M10.5.0/3" > /etc/TZ
		;;
		GMT_002|EET_002) #Finland, Estonia, Latvia, Belarus, Greece, Romania, Ukraine, Turkey
			echo "EET-2EEST,M3.5.0/3,M10.5.0/4" > /etc/TZ
		;;
		GMT_005) #Russia (Ekaterinburg)
			echo "YEKT-5YEKST,M3.5.0,M10.5.0/3" > /etc/TZ
		;;
		GMT_006) #Russia (Omsk)
			echo "OMST-6OMSST,M3.5.0,M10.5.0/3" > /etc/TZ
		;;
		GMT_009) #Russia (Yakutsk)
			echo "YAKT-9YAKST,M3.5.0,M10.5.0/3" > /etc/TZ
		;;
		AWS_008)		#Australia (WA/Perth)
			echo "WST-8" > /etc/TZ
		;;
		ACWS_8:45)		#Australia (Eucla)
			echo "CWST-8:45" > /etc/TZ
		;;
		ACS_9:30)		#Australia (NA/Darwin)
			echo "CST-9:30" > /etc/TZ
		;;
		ACSDST_9:30)	#Australia (SA/Adelaide/Broken Hill)
			echo "CST-9:30CST,M10.1.0,M4.1.0/3" > /etc/TZ
		;;
		AES_010)		#Australia (Queensland/Brisbane/Lindeman)
			echo "EST-10" > /etc/TZ
		;;
		AESDST_010)	#Australia (NSW/ACT/Canberra/Melbourne/Sydney/Hobart)
			echo "EST-10EST,M10.1.0,M4.1.0/3" > /etc/TZ
		;;
		ALHSDST_10:30)	#Australia (Lord Howe Island)
			echo "LHST-10:30LHST-11,M10.1.0,M4.1.0" > /etc/TZ
		;;
		NZS_012) #New Zealand
			echo "NZST-12NZDT,M9.5.0,M4.1.0/3" > /etc/TZ
		;;
	esac
fi

rm -rf /etc/tmpTZ
rm -rf /etc/tmpTZ2

