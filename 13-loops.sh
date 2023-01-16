#!/bin/bash

for courses in devops aws gcp azure terraform ansible docker ; do
    echo -e "Course is $courses \n"
done

val=0

while [ $val -lt 10] ; do
    echo "The value is $val"
    val=$(($val+1))
done