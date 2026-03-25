#!/bin/sh

. /sbin/global.sh

NetBIOS_Port=137
APP_NAME="udp-relay"

killall -q $APP_NAME

WL_VLAN=`nvram_get 2860 WL_VLAN`
opmode=`nvram_get 2860 OperationMode`
# Universal repeater mode && multiple LAN enabled.
if [ "$opmode" = "3" ] && [ "$WL_VLAN" == "1" ]; then
  $APP_NAME -f 1 $NetBIOS_Port $wan_if $lan_if "br1"
  echo "===>$APP_NAME -f 1 $NetBIOS_Port $wan_if $lan_if br1"
else
  $APP_NAME -f 1 $NetBIOS_Port $wan_if $lan_if
  echo "===>$APP_NAME -f 1 $NetBIOS_Port $wan_if $lan_if"
fi
