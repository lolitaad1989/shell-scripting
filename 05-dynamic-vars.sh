#!/bin/bash 
DATE=$(date +%F)
echo -e "Todays date is $DATE"
echo -e "Good morning todays date is \e[33m $DATE \e[0m"
echo -e "The total number of opened sessions is \e[32m $(who | wc -l)  \e[0m"