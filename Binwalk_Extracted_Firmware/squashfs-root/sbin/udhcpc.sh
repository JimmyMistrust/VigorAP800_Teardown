#!/bin/sh

# udhcpc script edited by Tim Riker <Tim@Rikers.org>

[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1

RESOLV_CONF="/etc/resolv.conf"
[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
[ -n "$subnet" ] && NETMASK="netmask $subnet"

GW_CMD_PATH="/tmp/gw_cmd.sh"

remove_lan_route()
{
  dev_name=$1
  lanip=$2
  
  if_exist=$(ifconfig | grep $dev_name)
  if [ "$if_exist" != "" ]; then
    lan_route=$(ip route | grep $dev_name | grep / | grep $lanip | awk '{print $1}')
    if [ "$lan_route" != "" ]; then
      ip route del $lan_route dev $dev_name
    fi
  fi
}

restart_daemon()
{		
  # remove local route
  opmode=`nvram_get 2860 OperationMode`
  IP_BR0=`ifconfig br0 | grep "inet addr" | sed 's/.*inet addr:\(.*\)  Bcast.*/\1/'`

  if [ "$IP_BR0" = "" ]; then
	exit
  fi

  if [ "$opmode" = "2" -o "$opmode" = "3" -o "$opmode_5g" = "1" ]; then
      # restart igmpproxy daemon
      config-igmpproxy.sh
  fi

  if [ "$opmode" = "2" ]; then
    [ $IP_BR0 ] && lan_ip=$IP_BR0 || lan_ip=`nvram_get 2860 lan_ipaddr`
	remove_lan_route "br0" $lan_ip
			
	#start udp relay daemon
	config-udp-relay.sh
  elif [ "$opmode" = "3" ]; then
    [ $IP_BR0 ] && lan1_ip=$IP_BR0 || lan1_ip=`nvram_get 2860 lan_ipaddr`
	remove_lan_route "br0" $lan1_ip
			
	lan2_ip=`nvram_get 2860 lan2_ipaddr`
	remove_lan_route "br1" $lan2_ip
			
	#start udp relay daemon
	config-udp-relay.sh
  fi

  # start dhcp-forwarder
  config-dhcp-fwr.sh &

  # G51518 : NTP should be restarted because it can't get NTP server IP from DNS server before DHCP process has been completed. --Sleer Huang
  if [ -x /sbin/ntp.sh ]; then
  	/sbin/ntp.sh &
  fi
}

case "$1" in
    leasefail)
        # Use static IP when the AP can't get IP from the DHCP Server.
        if [ "$interface" = "br0" ]; then
            if [ -f /var/udhcpc_br0_leasefail ]; then
                exit 0
            fi
            ip=$(nvram_get lan_ipaddr)
            subnet=$(nvram_get lan_netmask)
            ifconfig $interface $ip netmask $subnet

			restart_daemon

            echo $interface $1, APM register
            goahead apm_reg
            touch /var/udhcpc_br0_leasefail
        elif [ "$interface" = "br1" ]; then
            if [ -f /var/udhcpc_br1_leasefail ]; then
                exit 0
            fi
            ip=$(nvram_get lan2_ipaddr)
            subnet=$(nvram_get lan2_netmask)
            ifconfig $interface $ip netmask $subnet

            echo $interface $1
            touch /var/udhcpc_br1_leasefail
        fi
        ;;

    deconfig)
        rm /var/udhcpc_${interface}_leasefail 2>/dev/null
        /sbin/ifconfig $interface 0.0.0.0
        ;;

    renew|bound)
        rm /var/udhcpc_${interface}_leasefail 2>/dev/null
        /sbin/ifconfig $interface $ip $BROADCAST $NETMASK

        if [ -n "$router" ] ; then
            echo "deleting routers"
            while route del default gw 0.0.0.0 dev $interface ; do
                :
            done

            metric=0
            for i in $router ; do
                metric=`expr $metric + 1`
                route add default gw $i dev $interface metric $metric
                echo "#!/bin/sh" > $GW_CMD_PATH
                echo "route add default gw $i dev $interface metric $metric" >> $GW_CMD_PATH
                chmod 755 $GW_CMD_PATH
            done
        fi
        eval $(ipcalc -n $ip $subnet)
        route add -net $NETWORK netmask $subnet dev $interface 2>/dev/null
        echo -n > $RESOLV_CONF
        [ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
        for i in $dns ; do
            echo adding dns $i
            echo nameserver $i >> $RESOLV_CONF
        done
		# notify goahead when the WAN IP has been acquired. --yy
		killall -SIGUSR2 goahead

		restart_daemon
        if [ "$interface" = "br0" ]; then
            echo $interface $1, APM register
            goahead apm_reg
        fi
        ;;
		
	STATIC)
		sleep 5    
		restart_daemon
        ;;
esac

exit 0

