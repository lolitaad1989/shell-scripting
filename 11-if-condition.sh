#!/bin/bashc
# a=$1
# if  [ $a == ABC ] ; then
#     echo "Both values are equal"
#     exit 0
# else
#     echo "Both are not equal"
#     exit 1
# fi 


c=$1

c=$1 

if [ "$c" -eq "10" ] ; then  
    echo "value is c 10"

elif [ "$c" -eq "20" ] ; then  
    echo " value is c 30"

elif [ "$c" -eq "30" ] ; then  
    echo "value is c 30"

else  
    echo "value is not 10 or 20 or 30" 
    exit 100 
fi 