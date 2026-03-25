#!/bin/sh


case $1 in
	"init")
		#initial radius server
		if [ ! -f /etc/freeradius ]; then
			mkdir /etc/freeradius;
		fi
		cp -r /usr/share/fr_config/* /etc/freeradius/
		;;
	"set")
		#set radius server config file
		#1.user config
		rm /etc/freeradius/users
		USER_CONF=$(nvram_get 2860 IN_RADIUS_USER | sed -e 's/;/ /g')
		if [ "$USER_CONF" != "" ]; then
			for i in $USER_CONF
			do
				TMP_NAME=$(echo $i | awk 'FS="[,]+" {print $1}')
				TMP_PASS=$(echo $i | awk 'FS="[,]+" {print $2}')
				echo "\"$TMP_NAME\" Cleartext-Password := \"$TMP_PASS\", MS-CHAP-Use-NTLM-Auth := 0" >> /etc/freeradius/users
			done
		fi
		#2.client config
		rm /etc/freeradius/clients.conf
		#Add 127.0.0.1/ap800 client
		echo "client 127.0.0.1 {" >> /etc/freeradius/clients.conf
		echo "	secret = ap800" >> /etc/freeradius/clients.conf
		echo "	shortname = localhost" >> /etc/freeradius/clients.conf
		echo "}" >> /etc/freeradius/clients.conf		
		CLIENT_CONF=$(nvram_get 2860 IN_RADIUS_CLIENT | sed -e 's/;/ /g')
		if [ "$CLIENT_CONF" != "" ]; then
			for i in $CLIENT_CONF
			do
				TMP_IP=$(echo $i | awk 'FS="[,]+" {print $1}')
				TMP_SECRET=$(echo $i | awk 'FS="[,]+" {print $2}')
				echo "client $TMP_IP {" >> /etc/freeradius/clients.conf
				echo "	secret = $TMP_SECRET" >> /etc/freeradius/clients.conf
				echo "	shortname = $TMP_IP" >> /etc/freeradius/clients.conf
				echo "}" >> /etc/freeradius/clients.conf
			done
		fi
		;;
	"run")
		#run radius server
		RADIUS_EN=$(nvram_get 2860 IN_RADIUS_EN)
		if [ "$RADIUS_EN" = "1" ]; then
			radiusd -X &
		fi
		;;
	*)
		echo "unknown command: $1"
		;;
esac
