#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ] ; then
    echo -e "\e[31m You need to run the script has root user \e[0m"
    exit 1
fi 