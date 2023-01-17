#!/bin/bash


ID=$(id -u)
COMPONENT=frontend
source components/common.sh

echo -e "\e[32m ______ $COMPONENT Configuration is Starting  _________ \e[0m"
echo -n "Installing Nginx : "
#yum install nginx -y  &>> "${LOGFILE}"
yum install nginx -y     &>> "${LOGFILE}"
stat $?


echo -n "Downloading the $COMPONENT : "
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Clearing the default content : "
cd /usr/share/nginx/html
rm -rf *    &>> "${LOGFILE}"
stat $?

echo -n "Extracting $COMPONET : "
unzip -o /tmp/$COMPONENT.zip  &>> "${LOGFILE}"
stat $?

echo -n "Copying $COMPONET "
mv $COMPONENT-main/* .  &>> "${LOGFILE}"
mv static/* .   &>> "${LOGFILE}"
rm -rf $COMPONENT-main README.md   &>> "${LOGFILE}"
mv localhost.conf /etc/nginx/default.d/roboshop.conf  &>> "${LOGFILE}"
stat $?


echo -n "Restarting Nginx : "
systemctl enable nginx  &>> "${LOGFILE}"
systemctl restart nginx  &>> "${LOGFILE}"
stat $?


echo -e "\e[32m ______ $COMPONENT Configuration Completed _________ \e[0m"