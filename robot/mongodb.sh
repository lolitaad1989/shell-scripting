#!/bin/bash

set -e 

ID=$(id -u)
COMPONENT=mongodb
LOGFILE=/tmp/$COMPONENT.log

 stat () {
if [ $1 -eq 0 ] ; then
    echo -e "\e[32m Success \e[0m"
else 
    echo -e "\e[31m Failure \e[0m"
fi
 }


echo -e "\e[32m ______ $COMPONENT Configuration is Starting  _________ \e[0m"
echo -n "Installing Nginx : "
yum install nginx -y  &>> $LOGFILE
stat $?


echo -n "Downloading the $COMPONENT : "

curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo

echo -n "Installing the $COMPONENT : "
yum install -y mongodb-org  &>> $LOGFILE

echo -n "Starting $COMPONENT : "
systemctl enable mongod  &>> $LOGFILE
systemctl start mongod   &>> $LOGFILE
stat $?

echo -n "Downloading the $COMPONENT schema: "
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
stat $?

echo -n "Extracting  $COMPONENT schema: "
cd /tmp
unzip mongodb.zip   &>> $LOGFILE
stat $?

echo -n "Injecting  $COMPONENT schema: "
cd mongodb-main   
mongo < catalogue.js  &>> $LOGFILE
mongo < users.js   &>> $LOGFILE
stat $?