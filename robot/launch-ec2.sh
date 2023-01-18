#!/bin/bash 
# This script creates the server and the DNS Record

COMPONNET=$1
AMIID=$(aws ec2 describe-images  --filters "Name=name,Values=DevOps-LabImage-CentOS7" --region us-east-1 | jq .Images[].ImageId | sed -e 's/"//g')
SG_ID=$(aws ec2 describe-security-groups --filters Name=group-name,Values=b52-allow-all --region=us-east-1 | jq .SecurityGroups[].GroupId| sed -e 's/"//g')

echo "AMI ID used to launch hte instnace is $AMI_ID "
echo "Security Group ID used to launch hte instnace is $SG_ID "
echo "********** _________ $COMPONENT launch is in progress ______*********** "
