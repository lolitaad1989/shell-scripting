#!/bin/bash

set -e 

ID=$(id -u)
COMPONENT=catalogue
source robot/common.sh

echo -n "Congiguring Nodejs repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
yum install nodejs -y  &>> $LOGFILE
stat $?


echo -n "Creating Application user $APPUSER"
useradd roboshop
stat $?