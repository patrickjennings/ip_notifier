#!/bin/bash

EMAIL_ADDRESS='example@gmail.com'
CURRENT_IP=`dig +short myip.opendns.com @resolver1.opendns.com`
FILE_NAME='/home/patrick/.wan_ip'

if [ -f "$FILE_NAME" ]; then
    PREVIOUS_IP=`cat $FILE_NAME`
else
    PREVIOUS_IP=''
fi

if [ "$CURRENT_IP" != "$PREVIOUS_IP" ] ; then
    echo -e "Subject: IP Address Change: $CURRENT_IP" |
        msmtp -a default $EMAIL_ADDRESS
fi

echo "$CURRENT_IP" > "$FILE_NAME"
