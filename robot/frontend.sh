#!/bin/bash

ID=$(id -u)
COMPONENT=frontend
 stat () {
if [ $1 -eq 0 ] ; then
    echo -e "\e[32m Success \e[0m"
else 
    echo -e "\e[31m Failure \e[0m"
fi
 }



echo -n "Installing Nginx : "
yum install nginx -y  &>> /tmp/frontend.log
stat $?

echo -n "Enabling Nginx : "
systemctl enable nginx  &>> /tmp/frontend.log
stat $?

echo -n "Starting Nginx : "
systemctl start nginx  &>> /tmp/frontend.log
stat $?

echo -n "Downloading the $COMPONENT : "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf