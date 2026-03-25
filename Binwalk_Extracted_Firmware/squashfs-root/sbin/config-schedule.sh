#!/bin/sh
folder=/etc/crontabs/
fpath=/etc/crontabs/admin
cmd=call-schedule.sh

killall crond
sch_en=`nvram_get 2860 schedule-enable`

if [ "$sch_en" != "1" ]; then
  exit
fi

if [ ! -d $folder ]; then
  mkdir -p $folder
fi

if [ -f $fpath ]; then
  rm $fpath
fi

element="p1 p2 p3 p4 p5"
for i in $element ; do
  p_enable=`nvram_get 2860 $i-enable`
  if [ "$p_enable" = "1" ]; then
    tmp1=""
    tmp2=""
    p_acts=`nvram_get 2860 $i-acts`
    p_shour=`nvram_get 2860 $i-shour`
    p_smin=`nvram_get 2860 $i-smin`
    p_ehour=`nvram_get 2860 $i-ehour`
    p_emin=`nvram_get 2860 $i-emin`
    p_month=`nvram_get 2860 $i-month`
    p_day=`nvram_get 2860 $i-day`
    p_year=`nvram_get 2860 $i-year`
    #process acts: once(0), routine (1)
    if [ "$p_acts" = "0" ]; then
      tmp1="$p_smin $p_shour $p_day $p_month * "
      tmp2="$p_emin $p_ehour $p_day $p_month * "
    elif [ "$p_acts" = "1" ]; then
      p_weekday=`nvram_get 2860 $i-weekday`
      tmp1="$p_smin $p_shour * * $p_weekday "
      tmp2="$p_emin $p_ehour * * $p_weekday "
	elif [ "$p_acts" = "2" ]; then
      p_weekday=`nvram_get 2860 $i-weekday`
      tmp1="$p_smin $p_shour * * $p_weekday "
    fi

    #process action: 3g up(0), 3g down (1), auto reboot (2), send sms (3)
    p_action=`nvram_get 2860 $i-action`
	if [ "$p_action" = "2" ]; then
      echo "$tmp1 /sbin/$cmd 4 $p_smin $p_shour $p_day $p_month $p_year" >> $fpath
	elif [ "$p_action" = "4" ]; then
      echo "$tmp1 /sbin/$cmd 6 $p_smin $p_shour $p_day $p_month $p_year" >> $fpath
	elif [ "$p_action" = "5" ]; then
      echo "$tmp1 /sbin/$cmd 7 $p_smin $p_shour $p_day $p_month $p_year" >> $fpath
    fi
  fi
done

if [ -f $fpath ]; then
  crond -c $folder
fi




