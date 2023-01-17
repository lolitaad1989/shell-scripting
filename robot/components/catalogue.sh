#!/bin/bash

set -e 

ID=$(id -u)
COMPONENT=catalogue
source components/common.sh

echo -n "Congiguring Nodejs repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> $LOGFILE
yum install nodejs -y  &>> $LOGFILE
stat $?


echo -n "Creating Application user $APPUSER"
useradd roboshop &>> $LOGFILE
stat $?