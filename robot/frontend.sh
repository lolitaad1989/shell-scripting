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
yum install nginx -y  &>> /tmp/$COMPONENT.log
stat $?


echo -n "Downloading the $COMPONENT : "
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Clearing the default content : "
cd /usr/share/nginx/html
rm -rf * &>> /tmp/$COMPONENT.log
stat $?

echo -n "Extracting $COMPONET : "
unzip /tmp/$COMPONENT.zip >> /tmp/$COMPONENT.log
stat $?

echo -n "Copying $COMPONET "
mv $COMPONENT-main/* .  &>> /tmp/$COMPONENT.log
mv static/* .   &>> /tmp/$COMPONENT.log
rm -rf $COMPONENT-main README.md   &>> /tmp/$COMPONENT.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf  &>> /tmp/$COMPONENT.log
stat $?


echo -n "Restarting Nginx : "
systemctl enable nginx  &>> /tmp/$COMPONENT.log
systemctl restart nginx  &>> /tmp/$COMPONENT.log
stat $?