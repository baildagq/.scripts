#!/bin/sh
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
wslip=$(hostname -I | awk '{print $1}')
port=8889

PROXY_HTTP="http://${hostip}:${port}"

set_proxy(){
    export ALL_PROXY="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"
    export HTTPS_PROXY="${PROXY_HTTP}"
    echo $PROXY_HTTP
}

unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY
}

test_setting(){
    echo "Host ip:" ${hostip}
    echo "WSL ip:" ${wslip}
    echo "Current proxy:" $HTTPS_PROXY
}

if [ "$1" = "set" ]
then
    set_proxy

elif [ "$1" = "unset" ]
then
    unset_proxy

elif [ "$1" = "test" ]
then
    test_setting
else
    echo "Unsupported arguments."
fi

