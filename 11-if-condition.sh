#!/bin/bash

a=$1
if  [ $a == ABC ] ; then
    echo "Both values are equal"
    exit 0
else
    echo "Both are not equal"
    exit 1
fi 