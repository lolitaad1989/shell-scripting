#!/bin/bash

ACTION=$1

case $ACTION in
    start)
        echo "xyz service is starting"
        exit 0
        ;;
    stop)
        echo "xyz service is stopping"
        exit 0
        ;;
    restart)
        echo "xyz service is restarting"
        exit 0
        ;;
    *)
        echo -e "\e[32m Valid commands are start stop or restart only \e[0m"
        exit 1
        ;;
esac