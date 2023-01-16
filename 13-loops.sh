#!/bin/bash

for courses in devops aws gcp azure terraform ansible docker ; do
    echo -e "Course is $courses \n"
done

val=0

while [ $i -gt 10 ]; do
  echo i = $val
  i=$(($val+1))
done