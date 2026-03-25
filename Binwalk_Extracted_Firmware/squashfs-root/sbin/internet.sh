#!/bin/sh
#
# $Id: internet.sh,v 1.71 2009-02-25 01:31:35 steven Exp $
#
# usage: internet.sh
#
lockdir=/var/internet.sh.lock
while ! mkdir $lockdir 2>/dev/null; do sleep 1; done
trap 'rm -rf $lockdir' 0 2 9 15

. /sbin/config.sh
. /sbin/global.sh

lan_ip=`nvram_get 2860 lan_ipaddr`
stp_en=`nvram_get 2860 stpEnabled`
nat_en=`nvram_get 2860 natEnabled`
bssidnum=`nvram_get 2860 BssidNum`
radio_off=`nvram_get 2860 RadioOff`
wi_mc_enable0=`nvram_get 2860 wiMacCloneEnabled0`
wi_mc_enable1=`nvram_get 2860 wiMacCloneEnabled1`
wi_mc_mac0=`nvram_get 2860 wiMacCloneMac0`
wi_mc_mac1=`nvram_get 2860 wiMacCloneMac1`
AP_800_MODE=`nvram_get 2860 800_ap_mode`
ioskeepalive_enable=`nvram_get 2860 ioskeepaliveEnabled`

set_vlan_map()
{
	if [ "$CONFIG_RAETH_QOS_PORT_BASED" = "y" ]; then
	# vlan priority tag => skb->priority mapping
	vconfig set_ingress_map $1 0 0
	vconfig set_ingress_map $1 1 1
	vconfig set_ingress_map $1 2 2
	vconfig set_ingress_map $1 3 3
	vconfig set_ingress_map $1 4 4
	vconfig set_ingress_map $1 5 5
	vconfig set_ingress_map $1 6 6
	vconfig set_ingress_map $1 7 7

	# skb->priority => vlan priority tag mapping
	vconfig set_egress_map $1 0 0
	vconfig set_egress_map $1 1 1
	vconfig set_egress_map $1 2 2
	vconfig set_egress_map $1 3 3
	vconfig set_egress_map $1 4 4
	vconfig set_egress_map $1 5 5
	vconfig set_egress_map $1 6 6
	vconfig set_egress_map $1 7 7
	fi
}

ifRaxWdsxDown()
{
	ifconfig ra0 down > /dev/null 2>&1
	ifconfig ra1 down > /dev/null 2>&1
	ifconfig ra2 down > /dev/null 2>&1
	ifconfig ra3 down > /dev/null 2>&1

	ifconfig wds0 down > /dev/null 2>&1
	ifconfig wds1 down > /dev/null 2>&1
	ifconfig wds2 down > /dev/null 2>&1
	ifconfig wds3 down > /dev/null 2>&1

	ifconfig apcli0 down > /dev/null 2>&1

	ifconfig mesh0 down > /dev/null 2>&1
}

addBr0()
{
	brctl addbr br0
	# Make br0 enter forwarding state early.
	brctl setfd br0 1
	brctl addif br0 ra0
}

addBr0_StaMode()
{
	brctl addbr br0
	# Make br0 enter forwarding state early.
	brctl setfd br0 1
}

addRax2Br0()
{
	if [ "$bssidnum" = "2" ]; then
		brctl addif br0 ra1
	elif [ "$bssidnum" = "3" ]; then
		brctl addif br0 ra1
		brctl addif br0 ra2
	elif [ "$bssidnum" = "4" ]; then
		brctl addif br0 ra1
		brctl addif br0 ra2
		brctl addif br0 ra3
	fi
}

addWds2Br0()
{
	wds_en=`nvram_get 2860 WdsEnable`
	if [ "$wds_en" != "0" ]; then
		ifconfig wds0 up
		ifconfig wds1 up
		ifconfig wds2 up
		ifconfig wds3 up
		brctl addif br0 wds0
		brctl addif br0 wds1
		brctl addif br0 wds2
		brctl addif br0 wds3
	fi
}

addWds2Br0Br1()
{
	wds_en=`nvram_get 2860 WdsEnable`
	if [ "$wds_en" != "0" ]; then
		ifconfig wds0 up
		ifconfig wds1 up
		ifconfig wds2 up
		ifconfig wds3 up
		WDS0_EN=`nvram_get 2860 WdsVlan0`
		WDS1_EN=`nvram_get 2860 WdsVlan1`
		WDS2_EN=`nvram_get 2860 WdsVlan2`
		WDS3_EN=`nvram_get 2860 WdsVlan3`
		# 1: VLAN-A   2: VLAN-B
		if [ "$WDS0_EN" == "1" ]; then
			brctl addif br0 wds0
		elif [ "$WDS0_EN" == "2" ]; then
			brctl addif br1 wds0
		fi
		if [ "$WDS1_EN" == "1" ]; then
			brctl addif br0 wds1
		elif [ "$WDS1_EN" == "2" ]; then
			brctl addif br1 wds1
		fi
		if [ "$WDS2_EN" == "1" ]; then
			brctl addif br0 wds2
		elif [ "$WDS2_EN" == "2" ]; then
			brctl addif br1 wds2
		fi
		if [ "$WDS3_EN" == "1" ]; then
			brctl addif br0 wds3
		elif [ "$WDS3_EN" == "2" ]; then
			brctl addif br1 wds3
		fi
	fi
}

addMesh2Br0()
{
	meshenabled=`nvram_get 2860 MeshEnabled`
	if [ "$meshenabled" = "1" ]; then
		ifconfig mesh0 up
		brctl addif br0 mesh0
		meshhostname=`nvram_get 2860 MeshHostName`
		iwpriv mesh0 set  MeshHostName="$meshhostname"
	fi
}

addRaix2Br0()
{
	inic_bssnum=`nvram_get inic BssidNum`
	if [ "$CONFIG_RT2880_INIC" == "" -a "$CONFIG_INIC_MII" == "" -a "$CONFIG_INIC_PCI" == "" -a "$CONFIG_INIC_USB" == "" ]; then
		return
	fi
	brctl addif br0 rai0

	if [ "$inic_bssnum" = "2" ]; then
		ifconfig rai1 up
		brctl addif br0 rai1
	elif [ "$inic_bssnum" = "3" ]; then
		ifconfig rai1 up
		ifconfig rai2 up
		brctl addif br0 rai1
		brctl addif br0 rai2
	elif [ "$inic_bssnum" = "4" ]; then
		ifconfig rai1 up
		ifconfig rai2 up
		ifconfig rai3 up
		brctl addif br0 rai1
		brctl addif br0 rai2
		brctl addif br0 rai3
	elif [ "$inic_bssnum" = "5" ]; then
		ifconfig rai1 up
		ifconfig rai2 up
		ifconfig rai3 up
		ifconfig rai4 up
		brctl addif br0 rai1
		brctl addif br0 rai2
		brctl addif br0 rai3
		brctl addif br0 rai4
	elif [ "$inic_bssnum" = "6" ]; then
		ifconfig rai1 up
		ifconfig rai2 up
		ifconfig rai3 up
		ifconfig rai4 up
		ifconfig rai5 up
		brctl addif br0 rai1
		brctl addif br0 rai2
		brctl addif br0 rai3
		brctl addif br0 rai4
		brctl addif br0 rai5
	elif [ "$inic_bssnum" = "7" ]; then
		ifconfig rai1 up
		ifconfig rai2 up
		ifconfig rai3 up
		ifconfig rai4 up
		ifconfig rai5 up
		ifconfig rai6 up
		brctl addif br0 rai1
		brctl addif br0 rai2
		brctl addif br0 rai3
		brctl addif br0 rai4
		brctl addif br0 rai5
		brctl addif br0 rai6
	elif [ "$inic_bssnum" = "8" ]; then
		ifconfig rai1 up
		ifconfig rai2 up
		ifconfig rai3 up
		ifconfig rai4 up
		ifconfig rai5 up
		ifconfig rai6 up
		ifconfig rai7 up
		brctl addif br0 rai1
		brctl addif br0 rai2
		brctl addif br0 rai3
		brctl addif br0 rai4
		brctl addif br0 rai5
		brctl addif br0 rai6
		brctl addif br0 rai7
	fi
}

addInicWds2Br0()
{
	if [ "$CONFIG_RT2880_INIC" == "" -a "$CONFIG_INIC_MII" == "" -a "$CONFIG_INIC_PCI" == "" -a "$CONFIG_INIC_USB" == "" ]; then
		return
	fi
	wds_en=`nvram_get inic WdsEnable`
	if [ "$wds_en" != "0" ]; then
		ifconfig wdsi0 up
		ifconfig wdsi1 up
		ifconfig wdsi2 up
		ifconfig wdsi3 up
		brctl addif br0 wdsi0
		brctl addif br0 wdsi1
		brctl addif br0 wdsi2
		brctl addif br0 wdsi3
	fi
}

addRaL02Br0()
{
	if [ "$CONFIG_RT2561_AP" != "" ]; then
		brctl addif br0 raL0
	fi
}

genSysFiles()
{
	login=`nvram_get 2860 Login`
	pass=`nvram_get 2860 Password`
	if [ "$login" != "" -a "$pass" != "" ]; then
	echo "$login::0:0:Adminstrator:/:/bin/sh" > /etc/passwd
	echo "$login:x:0:$login" > /etc/group
		chpasswd.sh $login $pass
	fi
	if [ "$CONFIG_PPPOL2TP" == "y" ]; then
	echo "l2tp 1701/tcp l2f" > /etc/services
	echo "l2tp 1701/udp l2f" >> /etc/services
	fi
}

genDevNode()
{
#Linux2.6 uses udev instead of devfs, we have to create static dev node by myself.
if [ "$CONFIG_DWC_OTG" == "m" -a "$CONFIG_HOTPLUG" == "y" ]; then
	mounted=`mount | grep mdev | wc -l`
	if [ $mounted -eq 0 ]; then
	mount -t ramfs mdev /dev
	mkdir /dev/pts
	mount -t devpts devpts /dev/pts
    mdev -s

    mknod   /dev/video0      c       81      0
    mknod   /dev/spiS0       c       217     0
    mknod   /dev/i2cM0       c       218     0
    mknod   /dev/rdm0        c       254     0
    mknod   /dev/flash0      c       200     0
    mknod   /dev/swnat0      c       210     0
    mknod   /dev/hwnat0      c       220     0
    mknod   /dev/acl0        c       230     0
    mknod   /dev/ac0         c       240     0
    mknod   /dev/mtr0        c       250     0
    mknod   /dev/gpio        c       252     0
	mknod   /dev/PCM         c       233     0
	mknod   /dev/I2S         c       234     0
	fi

	echo "# <device regex> <uid>:<gid> <octal permissions> [<@|$|*> <command>]" > /etc/mdev.conf
    echo "# The special characters have the meaning:" >> /etc/mdev.conf
    echo "# @ Run after creating the device." >> /etc/mdev.conf
    echo "# $ Run before removing the device." >> /etc/mdev.conf
    echo "# * Run both after creating and before removing the device." >> /etc/mdev.conf
    echo "sd[a-z][1-9] 0:0 0660 */sbin/automount.sh \$MDEV" >> /etc/mdev.conf

    #enable usb hot-plug feature
    echo "/sbin/mdev" > /proc/sys/kernel/hotplug

fi
}

# Remove bridge device br0 & br1 before driver down
ifconfig br0 down > /dev/null 2>&1
ifconfig br1 down > /dev/null 2>&1
brctl delbr br0 > /dev/null 2>&1
brctl delbr br1 > /dev/null 2>&1

# opmode adjustment:
#   if AP client was not compiled and operation mode was set "3" -> set $opmode "1"
#   if Station was not compiled and operation mode was set "2" -> set $opmode "1"
if [ "$opmode" = "3" -a "$CONFIG_RT2860V2_AP_APCLI" != "y" ]; then
	nvram_set 2860 OperationMode 1
	opmode="1"
fi
if [ "$opmode" = "2" -a "$CONFIG_RT2860V2_STA" == "" ]; then
	nvram_set 2860 OperationMode 1
	opmode="1"
fi

genSysFiles
genDevNode

# stop dhcp client
killall -q udhcpc
killall -q udhcpc_apcli

# stop parprouted
parprouted_pid=$(ps | grep [p]arprouted)
if [ "$parprouted_pid" != "" ]; then
	killall parprouted
	sleep 1
fi

# stop udp relay daemon
killall -q udp-relay

# wireless mac clone
do_mac_clone="0"
if [ "$stamode" = "n" ]; then	# not station mode
	if [ "$opmode" = "0" ]; then
		if [ "$AP_800_MODE" = "0" -o "$AP_800_MODE" = "3" ]; then
			if [ "$wi_mc_enable1" = "1" -a "$wi_mc_mac1" != "" ]; then
				do_mac_clone="1"
			fi
		fi
	elif [ "$opmode" = "3" ]; then
		if [ "$wi_mc_enable1" = "1" -a "$wi_mc_mac1" != "" ]; then
			do_mac_clone="1"
		fi
	fi
fi
lan_mac=`ralink_init getmac lan`
ifconfig eth2 down
if [ "$do_mac_clone" = "1" ]; then	# let eth2 mac be the same as ra0, nancy
	ifconfig eth2 hw ether $wi_mc_mac1
else
	ifconfig eth2 hw ether $lan_mac
fi
ifconfig eth2 0.0.0.0

ifRaxWdsxDown
rmmod rt2860v2_ap > /dev/null 2>&1
rmmod rt2860v2_sta > /dev/null 2>&1
ralink_init make_wireless_config rt2860
if [ "$stamode" = "y" ]; then
	if [ "$opmode" = "2" -a "$wi_mc_enable0" = "1" -a "$wi_mc_mac0" != "" ]; then
		# wireless mac clone
		insmod -q rt2860v2_sta mac=$wi_mc_mac0
	else
		insmod -q rt2860v2_sta
	fi
else
	if [ "$CONFIG_RT2860V2_AP_DFS" = "y" ]; then
		insmod -q rt_timer
	fi
	if [ "$do_mac_clone" = "1" ]; then
		# wireless mac clone
		insmod -q rt2860v2_ap mac=$wi_mc_mac1
	else
		insmod -q rt2860v2_ap
	fi
fi

#vpn-passthru.sh --> nf_nat_pptp, nf_conntrack_pptp....don't exist. Don't need to execute it.

# config interface
ifconfig ra0 0.0.0.0
if [ "$ethconv" = "y" ]; then
	iwpriv ra0 set EthConvertMode=dongle
fi
if [ "$bssidnum" = "2" ]; then
	ifconfig ra1 0.0.0.0
elif [ "$bssidnum" = "3" ]; then
	ifconfig ra1 0.0.0.0
	ifconfig ra2 0.0.0.0
elif [ "$bssidnum" = "4" ]; then
	ifconfig ra1 0.0.0.0
	ifconfig ra2 0.0.0.0
	ifconfig ra3 0.0.0.0
fi

if [ "$CONFIG_RAETH_ROUTER" = "y" -o "$CONFIG_MAC_TO_MAC_MODE" = "y" -o "$CONFIG_RT_3052_ESW" = "y" ]; then
	vconfig add eth2 1 > /dev/null 2>&1
	set_vlan_map eth2.1 > /dev/null 2>&1
	vconfig add eth2 2 > /dev/null 2>&1
	set_vlan_map eth2.2 > /dev/null 2>&1
	ifconfig eth2.1 down
	ifconfig eth2.2 down
	if [ "$do_mac_clone" = "1" ]; then	# let eth2.1, eth2.2 mac be the same as ra0, nancy
		ifconfig eth2.1 hw ether $wi_mc_mac1
		ifconfig eth2.2 hw ether $wi_mc_mac1
	else
		ifconfig eth2.1 hw ether $lan_mac
		ifconfig eth2.2 hw ether $lan_mac
	fi
	ifconfig eth2.1 0.0.0.0
	ifconfig eth2.2 0.0.0.0
elif [ "$CONFIG_ICPLUS_PHY" = "y" ]; then
	#remove ip alias
	# it seems busybox has no command to remove ip alias...
	ifconfig eth2:1 0.0.0.0 1>&2 2>/dev/null
fi

ifconfig lo 127.0.0.1

# stop proxy_arp
echo 0 > /proc/sys/net/ipv4/conf/all/proxy_arp

# stop dhcp-forwarder
killall -q dhcp-forwarder

#
# init ip address to all interfaces for different OperationMode:
#   0 = Bridge Mode
#   1 = Gateway Mode
#   2 = Ethernet Converter Mode
#   3 = AP Client
#
if [ "$opmode" = "0" ]; then
	WL_VLAN=`nvram_get 2860 WL_VLAN`
	# 1. AP mode:  OperationMode=0, 800_ap_mode=0
	# 3. AP Bridge-Point to Point mode:  OperationMode=0, 800_ap_mode=1
    # 4. AP Bridge-Point to Multi-Point mode:  OperationMode=0, 800_ap_mode=2
	# 5. AP Bridge-WDS mode:  OperationMode=0, 800_ap_mode=3
	#bridge all interface together
	if [ "$WL_VLAN" == "0" ] || [ "$AP_800_MODE" == "1" ] || [ "$AP_800_MODE" == "2" ]; then
		addBr0
		if [ "$CONFIG_RAETH_ROUTER" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
			echo "##### restore IC+ to dump switch #####"
			config-vlan.sh 0 0
		elif [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
			echo "##### restore Vtss to dump switch #####"
			config-vlan.sh 1 0
		elif [ "$CONFIG_RT_3052_ESW" = "y" ]; then
			if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
				echo "##### restore RT3052 to dump switch #####"
				config-vlan.sh 2 0
				echo "##### restore Vtss to dump switch #####"
				config-vlan.sh 1 0
			else
				echo "##### restore RT3052 to dump switch #####"
				# Fanny : Setup vlan1(LAN-A) because of wireless VLAN function
				config-vlan.sh 2 LLLLL
			fi
		fi
		brctl addif br0 eth2.1
		if [ "$CONFIG_RT2860V2_AP_MBSS" = "y" -a "$bssidnum" != "1" ]; then
			addRax2Br0
		fi
		addWds2Br0
	else
	#set SSID with different VLAN interface
		brctl addbr br0
		brctl addbr br1
		#set VLAN
		config-vlan.sh 2 LWLLL
		#set SSID
		vlan1=`nvram_get 2860 SSID_VLAN1`
		vlan2=`nvram_get 2860 SSID_VLAN2`
		vlan3=`nvram_get 2860 SSID_VLAN3`
		vlan4=`nvram_get 2860 SSID_VLAN4`

		## Make br0 & br1 enter forwarding state early.
		brctl setfd br0 1
		brctl setfd br1 1
		if [ "$vlan1" == "1" ]; then
			echo "brctl addif br0 ra0"
			brctl addif br0 ra0
		fi
		if [ "$vlan1" == "2" ]; then
			echo "brctl addif br1 ra0"
			brctl addif br1 ra0
		fi
		if [ "$vlan2" == "1" ]; then
			echo "brctl addif br0 ra1"
			brctl addif br0 ra1
		fi
		if [ "$vlan2" == "2" ]; then
			echo "brctl addif br1 ra1"
			brctl addif br1 ra1
		fi
		if [ "$vlan3" == "1" ]; then
			echo "brctl addif br0 ra2"
			brctl addif br0 ra2
		fi
		if [ "$vlan3" == "2" ]; then
			echo "brctl addif br1 ra2"
			brctl addif br1 ra2
		fi
		if [ "$vlan4" == "1" ]; then
			echo "brctl addif br0 ra3"
			brctl addif br0 ra3
		fi
		if [ "$vlan4" == "2" ]; then
			echo "brctl addif br1 ra3"
			brctl addif br1 ra3
		fi
		brctl addif br0 eth2.1
		brctl addif br1 eth2.2
		addWds2Br0Br1
	fi

	#start mii iNIC after network interface is working
	iNIC_Mii_en=`nvram_get inic InicMiiEnable`
	if [ "$iNIC_Mii_en" == "1" ]; then
	     ifconfig rai0 down
	     rmmod iNIC_mii
	     insmod -q iNIC_mii miimaster=eth2
	     ifconfig rai0 up
	fi

	lan.sh
	echo 0 > /proc/sys/net/ipv4/ip_forward

	# start dhcp-forwarder
    config-dhcp-fwr.sh &
elif [ "$opmode" = "1" ]; then
	if [ "$CONFIG_RAETH_ROUTER" = "y" -o "$CONFIG_MAC_TO_MAC_MODE" = "y" -o "$CONFIG_RT_3052_ESW" = "y" ]; then
		if [ "$CONFIG_RAETH_ROUTER" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
			if [ "$CONFIG_WAN_AT_P1" = "y" ]; then
				echo '##### config IC+ vlan partition (LWLLL) #####'
				config-vlan.sh 0 LWLLL
			elif [ "$CONFIG_WAN_AT_P0" = "y" ]; then
				echo '##### config IC+ vlan partition (WLLLL) #####'
				config-vlan.sh 0 WLLLL
			else
				echo '##### config IC+ vlan partition (LLLLW) #####'
				config-vlan.sh 0 LLLLW
			fi
		fi
		if [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
			echo '##### config Vtss vlan partition #####'
			config-vlan.sh 1 1
		fi
		if [ "$CONFIG_RT_3052_ESW" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
			if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
				echo "##### restore RT3052 to dump switch #####"
				config-vlan.sh 2 0
				echo "##### config Vtss vlan partition #####"
				config-vlan.sh 1 1
			else
				if [ "$CONFIG_WAN_AT_P1" = "y" ]; then
					echo '##### config RT3052 vlan partition (LWLLL) #####'
					config-vlan.sh 2 LWLLL
				elif [ "$CONFIG_WAN_AT_P0" = "y" ]; then
					echo '##### config RT3052 vlan partition (WLLLL) #####'
					config-vlan.sh 2 WLLLL
				else
					echo '##### config RT3052 vlan partition (LLLLW) #####'
					config-vlan.sh 2 LLLLW
				fi
			fi
		fi
		addBr0
		brctl addif br0 eth2.1
		if [ "$CONFIG_RT2860V2_AP_MBSS" = "y" -a "$bssidnum" != "1" ]; then
			addRax2Br0
		fi
		addWds2Br0
		addMesh2Br0
		addRaix2Br0
		addInicWds2Br0
		addRaL02Br0
	fi

	# IC+ 100 PHY (one port only)
	if [ "$CONFIG_ICPLUS_PHY" = "y" ]; then
		echo '##### connected to one port 100 PHY #####'
		if [ "$CONFIG_RT2860V2_AP_MBSS" = "y" -a "$bssidnum" != "1" ]; then
			addBr0
			addRax2Br0
		fi
		addWds2Br0
		addMesh2Br0

		#
		# setup ip alias for user to access web page.
		#
		ifconfig eth2:1 172.32.1.254 netmask 255.255.255.0 up
	fi

	lan.sh
elif [ "$opmode" = "2" ]; then
	# 2. Station-Infrastructure mode:  OperationMode=2
	if [ "$CONFIG_RAETH_ROUTER" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
		echo "##### restore IC+ to dump switch #####"
		config-vlan.sh 0 0
	fi
	if [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
		echo "##### restore Vtss to dump switch #####"
		config-vlan.sh 1 0
	fi
	if [ "$CONFIG_RT_3052_ESW" = "y" ]; then
		if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
			echo "##### restore RT3052 to dump switch #####"
			config-vlan.sh 2 0
			echo "##### restore Vtss to dump switch #####"
			config-vlan.sh 1 0
		else
			echo "##### restore RT3052 to dump switch #####"
			config-vlan.sh 2 0
		fi
	fi

	addBr0_StaMode
	brctl addif br0 eth2

	udhcpc -i $wan_if -s /sbin/udhcpc.sh -p /var/run/udhcpc.pid &
	lan.sh
	echo 1 > /proc/sys/net/ipv4/ip_forward

	#start parprouted
	parprouted br0 ra0

elif [ "$opmode" = "3" ]; then
	WL_VLAN=`nvram_get 2860 WL_VLAN`
	# 6. Universal Repeater mode:  OperationMode=3
	if [ "$WL_VLAN" == "0" ]; then
		if [ "$CONFIG_RAETH_ROUTER" = "y" -o "$CONFIG_MAC_TO_MAC_MODE" = "y" -o "$CONFIG_RT_3052_ESW" = "y" ]; then
			if [ "$CONFIG_RAETH_ROUTER" = "y" ]; then
				echo "##### restore IC+ to dump switch #####"
				config-vlan.sh 0 0
			fi
			if [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
				echo "##### restore Vtss to dump switch #####"
				config-vlan.sh 1 0
			fi
			if [ "$CONFIG_RT_3052_ESW" = "y" ]; then
				if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
					echo "##### restore RT3052 to dump switch #####"
					config-vlan.sh 2 0
					echo "##### restore Vtss to dump switch #####"
					config-vlan.sh 1 0
				else
					echo "##### restore RT3052 to dump switch #####"
					config-vlan.sh 2 0
				fi
			fi
			addBr0
			brctl addif br0 eth2
			if [ "$CONFIG_RT2860V2_AP_MBSS" = "y" -a "$bssidnum" != "1" ]; then
				addRax2Br0
			fi
		fi
	else
		#set SSID with different VLAN interface
		brctl addbr br0
		brctl addbr br1
		#set VLAN
		config-vlan.sh 2 LWLLL
		#set SSID
		vlan1=`nvram_get 2860 SSID_VLAN1`
		vlan2=`nvram_get 2860 SSID_VLAN2`
		vlan3=`nvram_get 2860 SSID_VLAN3`
		vlan4=`nvram_get 2860 SSID_VLAN4`

		## Make br0 & br1 enter forwarding state early.
		brctl setfd br0 1
		brctl setfd br1 1
		if [ "$vlan1" == "1" ]; then
			echo "brctl addif br0 ra0"
			brctl addif br0 ra0
		fi
		if [ "$vlan1" == "2" ]; then
			echo "brctl addif br1 ra0"
			brctl addif br1 ra0
		fi
		if [ "$vlan2" == "1" ]; then
			echo "brctl addif br0 ra1"
			brctl addif br0 ra1
		fi
		if [ "$vlan2" == "2" ]; then
			echo "brctl addif br1 ra1"
			brctl addif br1 ra1
		fi
		if [ "$vlan3" == "1" ]; then
			echo "brctl addif br0 ra2"
			brctl addif br0 ra2
		fi
		if [ "$vlan3" == "2" ]; then
			echo "brctl addif br1 ra2"
			brctl addif br1 ra2
		fi
		if [ "$vlan4" == "1" ]; then
			echo "brctl addif br0 ra3"
			brctl addif br0 ra3
		fi
		if [ "$vlan4" == "2" ]; then
			echo "brctl addif br1 ra3"
			brctl addif br1 ra3
		fi
		brctl addif br0 eth2.1
		brctl addif br1 eth2.2
	fi
	lan.sh
	echo 1 > /proc/sys/net/ipv4/ip_forward

	#start parprouted
	if [ "$WL_VLAN" == "1" ]; then
	  parprouted br0 apcli0
	  parprouted br1 apcli0
	else
	  parprouted br0 apcli0
	fi

	config-apcli.sh SetApCliWAN
else
	echo "unknown OperationMode: $opmode"
	exit 1
fi

if [ "$radio_off" = "1" ]; then
	ifRaxWdsxDown
fi

# in order to use broadcast IP address in L2 management daemon
if [ "$CONFIG_ICPLUS_PHY" = "y" ]; then
	route add -host 255.255.255.255 dev $wan_if
else
	route add -host 255.255.255.255 dev $lan_if
fi

# set dns server (for ap800 tr069)
config-dns.sh

m2uenabled=`nvram_get 2860 M2UEnabled`
if [ "$m2uenabled" = "1" ]; then
	iwpriv ra0 set IgmpSnEnable=1
	echo "iwpriv ra0 set IgmpSnEnable=1"
fi

# Add these netfilter xtables support
insmod xt_TCPMSS  > /dev/null 2>&1
insmod xt_tcpmss  > /dev/null 2>&1

killall dray_keepalive > /dev/null 2>&1
if [ "$ioskeepalive_enable" = "1" ]; then
	dray_keepalive &
fi

dhcpc_en=`nvram_get 2860 dhcpc_lanA_en`
dhcpc2_en=`nvram_get 2860 dhcpc_lanB_en`
dhcpc_exist=$(ps | grep "[u]dhcpc -i br0 -s")
dhcpc2_exist=$(ps | grep "[u]dhcpc -i br1 -s")
ap_mode=`nvram_get 2860 800_ap_mode`

[ -z $dhcpc_en ] && dhcpc_en=1
[ -z $dhcpc2_en ] && dhcpc2_en=0

# Workaround: udhcpc is gone for an unknown problem, so we check and restart here
if [ "$dhcpc_en" = "1" -a "$dhcpc_exist" = "" ]; then
    udhcpc -i br0 -s /sbin/udhcpc.sh &  
fi
if [ "$ap_mode" != "1" -a "$ap_mode" != "2" -a "$dhcpc2_en" = "1" -a "$dhcpc2_exist" = "" ]; then
    udhcpc -i br1 -s /sbin/udhcpc.sh &
fi
