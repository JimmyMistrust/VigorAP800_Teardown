#!/bin/sh

. /sbin/global.sh

CONF_FILE1=/etc/dhcp-fwr1.conf
CONF_FILE2=/etc/dhcp-fwr2.conf

ap_mode=`nvram_get 2860 800_ap_mode`
dhcp1=`nvram_get 2860 dhcpEnabled`
dhcp2=`nvram_get 2860 dhcp2Enabled`
if [ "$opmode" = "0" ]; then
  if [ "$ap_mode" != "0" ]; then
    exit 0
  elif [ "$dhcp1" != "2" -a "$dhcp2" != "2" ]; then
    exit 0
  fi   
fi

if [ "$dhcp1" = "1" ] && [ "$dhcp2" = "1" ]; then
  exit 0
fi

LANB_NAME="br1"
DELAY_TIME=5

# stop dhcp-forwarder
killall -q dhcp-forwarder

# check apcli interface ip
if [ "$opmode" = "3" ]; then
  IP_APCLI=$(ifconfig $wan_if | grep "inet addr" | sed 's/.*inet addr:\(.*\)  Bcast.*/\1/')
  if [ "$IP_APCLI" = "" ]; then
    echo "config-dhcp-fwr.sh $wan_if ip is empty !!!"
    exit
  fi
fi

start_dhcp_fwr()
{
  #generate config file
  echo "## Logfile and loglevel."  > $2
  echo "## The loglevel option is not supported yet." >> $2
  echo "logfile		/var/log/dhcp-fwd$3.log" >> $2
  echo "loglevel	1" >> $2
  echo "" >> $2

  echo "## SysV pidfile contains the PID of the daemon-process." >> $2
  echo "pidfile		/var/run/dhcp-fwd$3.pid" >> $2
  echo "" >> $2

  echo "## Set limit for resources." >> $2
  echo "ulimit core	0" >> $2
  echo "ulimit stack	64K" >> $2
  echo "ulimit data	32K" >> $2
  echo "ulimit rss	200K" >> $2
  echo "ulimit nproc	0" >> $2
  echo "ulimit nofile	0" >> $2
  echo "ulimit as	0" >> $2
  echo "" >> $2

  echo "########## INTERFACE SETTINGS #########" >> $2
  echo "##" >> $2
  echo "#	IFNAME	clients	servers bcast" >> $2
  echo "if	$1	true	false	true" >> $2
  if [ "$4" != "" ]; then
   echo "if	$4	true	false	true" >> $2
  fi
  if [ "$opmode" != "0" ]; then
    echo "if	$wan_if	false	true	true" >> $2
	echo "if	$wan_if	true	false	true" >> $2
    echo "" >> $2

    echo "########## SERVER SETTINGS ##########" >> $2
    echo "##" >> $2
    echo "#	TYPE	address" >> $2
    echo "server	bcast	$wan_if" >> $2
  fi	

  sleep $DELAY_TIME
}

dhcpRelayIP=`nvram_get 2860 dhcpRelay`
if [ "$dhcp1" = "2" -a "$dhcpRelayIP" != "" ]; then
  dhcpRelayCMD="-i $dhcpRelayIP"
else
  dhcpRelayCMD=""  
fi

dhcp2RelayIP=`nvram_get 2860 dhcp2Relay`
if [ "$dhcp2" = "2" -a "$dhcp2RelayIP" != "" ]; then
  dhcp2RelayCMD="-j $dhcp2RelayIP"
else
  dhcp2RelayCMD=""
fi

if [ "$opmode" = "0" ]; then
  #check lan2 exist or not
  lanb_exist=""
  if [ "$dhcp2" = "2" ]; then
    WL_VLAN=`nvram_get 2860 WL_VLAN`
    if [ "$WL_VLAN" == "1" ]; then
      lanb_exist="1"
    fi
  fi
  
  if [ "$dhcp1" = "2" ] && [ "$lanb_exist" = "" ]; then
    start_dhcp_fwr $lan_if $CONF_FILE1 "1"
    dhcp-forwarder -c $CONF_FILE1 -d -a $dhcpRelayCMD &
  elif [ "$dhcp1" != "2" ] && [ "$lanb_exist" = "1" ]; then
    start_dhcp_fwr $LANB_NAME $CONF_FILE1 "1"
    dhcp-forwarder -c $CONF_FILE1 -d -a $dhcp2RelayCMD &
  elif [ "$dhcp1" = "2" ] && [ "$lanb_exist" = "1" ]; then
    start_dhcp_fwr $lan_if $CONF_FILE1 "1" $LANB_NAME
    dhcp-forwarder -c $CONF_FILE1 -d -b -a $dhcpRelayCMD $dhcp2RelayCMD &
  fi
elif [ "$opmode" = "2" ] && [ "$dhcp1" != "1" ] ; then
  start_dhcp_fwr $lan_if $CONF_FILE1 "1"
  dhcp-forwarder -c $CONF_FILE1 -d $dhcpRelayCMD &
elif [ "$opmode" = "3" ]; then
  #check lan2 exist or not
  lanb_exist=""
  if [ "$dhcp2" != "1" ]; then
    WL_VLAN=`nvram_get 2860 WL_VLAN`
    if [ "$WL_VLAN" == "1" ]; then
      lanb_exist="1"
    fi
  fi

  if [ "$dhcp1" != "1" ] && [ "$lanb_exist" = "" ]; then
    start_dhcp_fwr $lan_if $CONF_FILE1 "1"
    dhcp-forwarder -c $CONF_FILE1 -d $dhcpRelayCMD &
  elif [ "$dhcp1" = "1" ] && [ "$lanb_exist" = "1" ]; then
    start_dhcp_fwr $LANB_NAME $CONF_FILE1 "1"
    dhcp-forwarder -c $CONF_FILE1 -d $dhcp2RelayCMD &
  elif [ "$dhcp1" != "1" ] && [ "$lanb_exist" = "1" ]; then
    start_dhcp_fwr $lan_if $CONF_FILE1 "1" $LANB_NAME
    dhcp-forwarder -c $CONF_FILE1 -d -b $dhcpRelayCMD $dhcp2RelayCMD &
  fi
fi
