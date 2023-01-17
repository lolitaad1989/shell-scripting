#!/bin/bash

set -e 

COMPONENT=catalogue
source components/common.sh

echo -e "\e[32m ______ $COMPONENT Configuration Started _________ \e[0m"

echo -n "Congiguring Nodejs repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> "${LOGFILE}"
yum install nodejs -y  &>> "${LOGFILE}"
stat $?

echo -n "Installing Nodejs: "
yum install nodejs -y  &>> "${LOGFILE}"
stat $?

id $APPUSER &>> "${LOGFILE}"
if [ $? -ne 0 ] ; then
    echo -n "Creating Application user $APPUSER"
    useradd roboshop &>> "${LOGFILE}"
    stat $?
fi

echo -n "Downloading the $COMPONENT :"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?


echo -n "Performing cleanup and extraction $COMPONENT :"
rm -rf /home/$APPUSER/$COMPONENT/
cd /home/$APPUSER
unzip -o /tmp/$COMPONENT.zip    &>> "${LOGFILE}"
stat $?


echo -n "Changing the permissions to $APPUSER :"
mv $COMPONENT-main $COMPONENT
chown -R $APPUSER:$APPUSER /home/$APPUSER/$COMPONENT
# cd /home/roboshop/$COMPONENT
# npm install
stat $?

echo -n "Installing $COMPONENT dependencies :"
cd $COMPONENT
npm install &>> "${LOGFILE}"
stat $?

echo -n "Configuring the  $COMPONENT services :"
sed -i -e  's/REDIS_ENDPOINT/redis.roboshop.internal/' 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/$APPUSER/$COMPONENT/systemd.service 
mv /home/$APPUSER/$COMPONENT/systemd.service /etc/systemd/system/$COMPONENT.service
stat $?

echo -n "Starting  the  $COMPONENT services :"
systemctl daemon-reload  &>> "${LOGFILE}"
systemctl restart $COMPONENT  &>> "${LOGFILE}"
systemctl enable $COMPONENT  &>> "${LOGFILE}"
stat $?

echo -e "\e[32m ______ $COMPONENT Configuration Completed _________ \e[0m"