#!/bin/bash

EMAIL_ADDRESS='example@gmail.com'
FILE_PATH='/home/patrick/.wan_ip'
CURRENT_IP=`dig +short myip.opendns.com @resolver1.opendns.com`
PREVIOUS_IP=''

if [ -f "$FILE_PATH" ]; then
    PREVIOUS_IP=`cat $FILE_PATH`
fi

if [ "$CURRENT_IP" != "$PREVIOUS_IP" ] ; then
    echo -e "Subject: IP Address Change: $CURRENT_IP" |
        msmtp -a default $EMAIL_ADDRESS
fi

echo "$CURRENT_IP" > "$FILE_PATH"
