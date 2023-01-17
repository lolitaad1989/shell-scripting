#!/bin/bash

set -e 

ID=$(id -u)
COMPONENT=mongodb
source components/common.sh


echo -n "Downloading the $COMPONENT : "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?

echo -n "Installing the $COMPONENT : "
yum install -y mongodb-org  &>> $"${LOGFILE}"
stat $?

echo -n "whitelisting the mongodb"
sed -i -e  's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

echo -n "Starting $COMPONENT : "
systemctl enable mongod  &>> $"${LOGFILE}"
systemctl start mongod   &>> $"${LOGFILE}"
stat $?

echo -n "Downloading the $COMPONENT schema: "
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
stat $?

echo -n "Extracting  $COMPONENT schema: "
cd /tmp
unzip -o  mongodb.zip   &>> $"${LOGFILE}"
stat $?

echo -n "Injecting  $COMPONENT schema: "
cd mongodb-main   
mongo < catalogue.js  &>> $"${LOGFILE}"
mongo < users.js   &>> $"${LOGFILE}"
stat $?