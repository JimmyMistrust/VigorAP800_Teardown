#!/bin/sh

# $Id: config-dns.sh,v 1.2 2007-10-15 08:26:00 winfred Exp $
# usage: config-dns.sh [<dns1>] [<dns2>]

fname="/etc/resolv.conf"
fbak="/etc/resolv_conf.bak"

pd=`nvram_get 2860 wan_primary_dns`
sd=`nvram_get 2860 wan_secondary_dns`

if [ "$pd" == "" -a "$sd" == "" ]; then
	pd="168.95.1.1"
fi

# in case no previous file
touch $fname

# backup file without nameserver part
sed -e '/nameserver/d' $fname > $fbak

# set primary and seconday DNS
if [ "$pd" != "" ]; then
  echo "nameserver $pd" > $fname
else # empty dns
  rm -f $fname
fi
if [ "$sd" != "" ]; then
  echo "nameserver $sd" >> $fname
fi

cat $fbak >> $fname
rm -f $fbak

