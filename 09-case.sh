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
        echo "Valid commands are start stop or restart only"
        exit 0"
        ;;
esac