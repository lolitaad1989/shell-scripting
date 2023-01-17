#!/bin/bash

set -e 

COMPONENT=catalogue
source components/common.sh

echo -n "Congiguring Nodejs repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> "${LOGFILE}"
yum install nodejs -y  &>> "${LOGFILE}"
stat $?


echo -n "Creating Application user $APPUSER"
useradd roboshop &>> "${LOGFILE}"
stat $?

echo -n "Downloading the $COMPONENT :"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Extracting the $COMPONENT :"
cd /home/$APPUSER
unzip -o /tmp/$COMPONENT.zip    &>> "${LOGFILE}"
mv $COMPONENT-main $COMPONENT
cd /home/roboshop/$COMPONENT
npm install
stat $?