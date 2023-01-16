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


echo -n "Downloading the $COMPONENT : "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Clearing the default content : "
cd /usr/share/nginx/html
rm -rf * &>> /tmp/frontend.log
stat $?

echo -n "Extracting $COMPONET : "
unzip /tmp/frontend.zip
stat $?

echo -n "Copying $COMPONET "
mv frontend-main/* .  &>> /tmp/frontend.log
mv static/* .   &>> /tmp/frontend.log
rm -rf frontend-main README.md   &>> /tmp/frontend.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf  &>> /tmp/frontend.log
stat $?


echo -n "Restarting Nginx : "
systemctl enable nginx  &>> /tmp/frontend.log
systemctl restart nginx  &>> /tmp/frontend.log
stat $?