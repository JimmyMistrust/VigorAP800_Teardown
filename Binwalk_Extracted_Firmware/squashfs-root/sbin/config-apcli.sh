#!/bin/sh

wanmode=`nvram_get 2860 wanConnectionMode`

ApCliSetWAN()
{
    wan_if="apcli0"

    if [ "$wanmode" = "STATIC" ]; then
	  echo "config-apcli.sh set STATIC"
	  ip=`nvram_get 2860 wan_ipaddr`
	  nm=`nvram_get 2860 wan_netmask`
	  gw=`nvram_get 2860 wan_gateway`
	  ifconfig $wan_if $ip netmask $nm
	  route del default
	  if [ "$gw" != "" ]; then
	    # G57316 : Add default gateway into apcli0 interface. -- Louis
	    route add default gw $gw dev $wan_if metric 1
	  fi
	  killall udhcpc.sh
	  udhcpc.sh $wanmode &
	else
	  echo "config-apcli.sh set DHCP"
	  killall -q udhcpc_apcli
	  host=`nvram_get 2860 HostName`
	  if [ "$host" == "" ]; then
	    host="AP800"
	  fi
	  udhcpc_apcli -i $wan_if -s /sbin/udhcpc.sh -H $host -p /var/run/udhcpc_apcli.pid &
	fi
}

if [ "$1" == "SetApCliWAN" ]; then
	ApCliSetWAN
	exit
fi
