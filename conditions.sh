#! /bin/bash

number=$1
if [ $number -gt 20 ]; then
    echo " given number is greater than 20 "
elif [ $number -eq 20 ]; then
    echo " given number is equal to 20 "
else
    echo " given number is less than 20 "
fi  