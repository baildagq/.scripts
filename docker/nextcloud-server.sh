#!/bin/bash

case $1 in
    'on')
        docker start nextcloud_db
        docker start nextcloud
        ;;
    'off')
        docker stop nextcloud_db
        docker stop nextcloud
        ;;
    '*')
        ;;
esac;
