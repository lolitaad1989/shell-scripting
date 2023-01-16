#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ] ; then
    echo -e "\e[31m You need to run the script has root user \e[0m"
    exit 1
fi 

echo -n "Installing Nginx :"
yum install nginx -y  &>> /tmp/frontend.log
if [ $? -eq 0 ] ; then
    echo -e "Success"
else 
    echo -e "Failure"
    fi

echo -n "Enabling Nginx :"
systemctl enable nginx  &>> /tmp/frontend.log
if [ $? -eq 0 ] ; then
    echo -e "Success"
else 
    echo -e "Failure"
    fi

echo -n "Starting Nginx :"
systemctl start nginx  &>> /tmp/frontend.log
if [ $? -eq 0 ] ; then
    echo -e "Success"
else 
    echo -e "Failure"
    fi