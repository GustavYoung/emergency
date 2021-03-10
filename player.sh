#!/bin/bash
#Copyright 2017-2018 Gustavo Santana
#(C) 2017-2018 Mirai Works LLC
#Desactivamos el puto cursor >P
setterm -cursor off
sleep 1;
#set -x

#OMXPLAYER_DBUS_ADDR="/tmp/omxplayerdbus.${USER:-root}"
#OMXPLAYER_DBUS_PID="/tmp/omxplayerdbus.${USER:-root}.pid"
#export DBUS_SESSION_BUS_ADDRESS=`cat $OMXPLAYER_DBUS_ADDR`
#export DBUS_SESSION_BUS_PID=`cat $OMXPLAYER_DBUS_PID`

#Limpiamos la jodida pantalla?
#sudo sh -c “TERM=linux setterm -foreground black -clear >/dev/tty0”

VIDEOPATH="/home/uslu/ropongi/uploads/genres";

# Nombre de instancia para que no choque con la de uxmalstream
SERVICE="omxplayer2";

# infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep 1;
else
        for entry in `ls -R $VIDEOPATH | sort -R`;
        do
	echo "start $entry" >> log_$(date +%Y_%m_%d).txt;
        echo "start $entry";
        date >> log_$(date +%Y_%m_%d).txt;
	clear;
        cmdpid="$BASHPID";
        omxplayer --genlog -o local "$entry" >> log_$(date +%Y_%m_%d).txt
	    date >> log_$(date +%Y_%m_%d).txt;
	    echo "Stop $entry" >> log_$(date +%Y_%m_%d).txt;
        echo "Stop $entry";
        clear;
        echo "." >> log_$(date +%Y_%m_%d).txt;
        done
fi
done