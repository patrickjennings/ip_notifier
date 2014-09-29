#!/bin/bash

CURRENT_IP=`dig +short myip.opendns.com @resolver1.opendns.com`
FILE_NAME='/home/patrick/.wan_ip'

if [ -f "$FILE_NAME" ]; then
    PREVIOUS_IP=`cat $FILE_NAME`
else
    PREVIOUS_IP=''
fi

if [ "$CURRENT_IP" != "$PREVIOUS_IP" ] ; then
    echo "IP Address Change: $CURRENT_IP" | msmtp -a default sycadellicman@gmail.com
    # echo $CURRENT_IP
fi

echo "$CURRENT_IP" > "$FILE_NAME"
