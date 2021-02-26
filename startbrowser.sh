#!/bin/bash

# proxychains firefox

pgrep qv2ray > /dev/null
flag=$?
if [ $flag -eq 0 ]
then
    google-chrome-stable --proxy-server="socks5://127.0.0.1:1089"
else
    google-chrome-stable
fi
