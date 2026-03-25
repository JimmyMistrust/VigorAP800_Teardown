#!/bin/sh
#
# $Id: lan.sh,v 1.24.2.1 2009-04-21 12:49:37 michael Exp $
#
# usage: lan.sh [ cur_lan_ip [ cur_lan_nm ] ]
#

. /sbin/global.sh

# stop all
killall -q udhcpd
killall -q lld2d
killall -q igmpproxy
killall -q upnpd
killall -q radvd
killall -q pppoe-relay
killall -q dnsmasq
rm -rf /var/run/lld2d-*
echo "" > /var/udhcpd.leases

# ip address
ip=`nvram_get 2860 lan_ipaddr`
nm=`nvram_get 2860 lan_netmask`
ifconfig $lan_if down
ifconfig $lan_if $ip netmask $nm

#AP mode with 2 VLAN group: if br1 existed, set br1 up
IF_BR1=`ifconfig br1 | grep "Link encap"`
if [ "$IF_BR1" != "" ]; then
	ip2=`nvram_get 2860 lan2_ipaddr`
	nm2=`nvram_get 2860 lan2_netmask`
	ifconfig br1 $ip2 netmask $nm2
else
	# If br1 does not existed, set br1 up here...
	# Otherwise 802.1x daemon can't boot up.    Bruce Hsu 2012/03/28
	# Please reference to restart8021XDaemon(), /etc/Wireless/RT2860/RT2860.dat
	brctl addbr br1
	brctl addif br1 eth2.2
	ifconfig br1 0.0.0.0
fi
opmode=`nvram_get 2860 OperationMode`
if [ "$opmode" = "0" ]; then
	gw=`nvram_get 2860 wan_gateway`
	pd=`nvram_get 2860 wan_primary_dns`
	sd=`nvram_get 2860 wan_secondary_dns`
	route del default

	if [ "$gw" != "" ]; then
	  route add default gw $gw
	fi

	config-dns.sh $pd $sd

	#add lan gateway
    if [ -z "`route -n|grep UG`" ]; then
        lan_gw=`nvram_get 2860 lan_gateway`
        if [ "$lan_gw" != "" ]; then
          ip route add default via $lan_gw
        fi
    fi
fi

# hostname
host=`nvram_get 2860 HostName`
if [ "$host" = "" ]; then
	host="draytek"
	nvram_set 2860 HostName $host
fi
#hostname $host
echo "127.0.0.1 localhost.localdomain localhost" > /etc/hosts
echo "$ip $host.draytek.com $host" >> /etc/hosts

#kill all dhcp server
config-udhcpd.sh -k
config-udhcpd2.sh -k

# Start lpd ---- lpd needs to be started after hostname setup ok.
killall lpd > /dev/null 2>&1
lpd &

#dhcp server 1
dhcp=`nvram_get 2860 dhcpEnabled`
if [ "$dhcp" = "1" ]; then
	start=`nvram_get 2860 dhcpStart`
	end=`nvram_get 2860 dhcpEnd`
	mask=`nvram_get 2860 dhcpMask`
	pd=`nvram_get 2860 dhcpPriDns`
	sd=`nvram_get 2860 dhcpSecDns`
	gw=`nvram_get 2860 dhcpGateway`
	lease=`nvram_get 2860 dhcpLease`
	static1=`nvram_get 2860 dhcpStatic1 | sed -e 's/;/ /'`
	static2=`nvram_get 2860 dhcpStatic2 | sed -e 's/;/ /'`
	static3=`nvram_get 2860 dhcpStatic3 | sed -e 's/;/ /'`
	config-udhcpd.sh -s $start
	config-udhcpd.sh -e $end
	config-udhcpd.sh -i $lan_if
	config-udhcpd.sh -m $mask
	if [ "$pd" != "" -o "$sd" != "" ]; then
		config-udhcpd.sh -d $pd $sd
	fi
	if [ "$gw" != "" ]; then
		config-udhcpd.sh -g $gw
	fi
	if [ "$lease" != "" ]; then
		config-udhcpd.sh -t $lease
	fi
	if [ "$static1" != "" ]; then
		config-udhcpd.sh -S $static1
	fi
	if [ "$static2" != "" ]; then
		config-udhcpd.sh -S $static2
	fi
	if [ "$static3" != "" ]; then
		config-udhcpd.sh -S $static3
	fi
	config-udhcpd.sh -r 1
fi

#dhcp server 2
dhcp2=`nvram_get 2860 dhcp2Enabled`
lan_if2="br1"
if [ "$dhcp2" = "1" -a "$IF_BR1" != "" ]; then
	start2=`nvram_get 2860 dhcp2Start`
	end2=`nvram_get 2860 dhcp2End`
	mask2=`nvram_get 2860 dhcp2Mask`
	pd2=`nvram_get 2860 dhcp2PriDns`
	sd2=`nvram_get 2860 dhcp2SecDns`
	gw2=`nvram_get 2860 dhcp2Gateway`
	lease2=`nvram_get 2860 dhcp2Lease`
	config-udhcpd2.sh -s $start2
	config-udhcpd2.sh -e $end2
	config-udhcpd2.sh -i $lan_if2
	config-udhcpd2.sh -m $mask2
	if [ "$pd2" != "" -o "$sd2" != "" ]; then
		config-udhcpd2.sh -d $pd2 $sd2
	fi
	if [ "$gw2" != "" ]; then
		config-udhcpd2.sh -g $gw2
	fi
	if [ "$lease2" != "" ]; then
		config-udhcpd2.sh -t $lease2
	fi
	config-udhcpd2.sh -r 1
fi


# stp
if [ "$wan_if" = "br0" -o "$lan_if" = "br0" ]; then
	stp=`nvram_get 2860 stpEnabled`
	if [ "$stp" = "1" ]; then
		brctl setfd br0 15
		brctl stp br0 1
	else
		brctl setfd br0 1
		brctl stp br0 0
	fi
fi

# lltd
lltd=`nvram_get 2860 lltdEnabled`
if [ "$lltd" = "1" ]; then
	lld2d $lan_if
fi

# igmpproxy
igmp=`nvram_get 2860 igmpEnabled`
if [ "$igmp" = "1" ]; then
	config-igmpproxy.sh $wan_if $lan_if
fi

# upnp
if [ "$opmode" = "0" -o "$opmode" = "1" ]; then
	upnp=`nvram_get 2860 upnpEnabled`
	if [ "$upnp" = "1" ]; then
		route add -net 239.0.0.0 netmask 255.0.0.0 dev $lan_if
		upnp_xml.sh $ip
		upnpd -f $wan_ppp_if $lan_if &
	fi
fi

# radvd
radvd=`nvram_get 2860 radvdEnabled`
if [ "$radvd" = "1" ]; then
	ifconfig sit0 down
	echo "0" > /proc/sys/net/ipv6/conf/all/forwarding
	echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
	ifconfig sit0 up
	ifconfig sit0 add 2002:1101:101::1101:101/16
	route -A inet6 add 2000::/3 gw ::17.1.1.20 dev sit0
	route -A inet6 add 2002:1101:101:0::/64 dev br0
	radvd -C /etc_ro/radvd.conf -d 1 &
fi

# pppoe-relay
pppr=`nvram_get 2860 pppoeREnabled`
if [ "$pppr" = "1" ]; then
	pppoe-relay -S $wan_if -B $lan_if
fi

#if rt3572 exist, configure it
config-rt3572 vlan

# internal radius server
killall radiusd
radius.sh set
radius.sh run

#ntp
if [ -x /sbin/ntp.sh ]; then
	/sbin/ntp.sh &
fi

