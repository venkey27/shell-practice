#! /bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE=$LOGS_DIR/$0.log

if [ $USERID -ne 0 ]; then
    echo " run the script with ROOT USER "
    exit 1
fi

# 1st arguement -> whar package we want to install
# 2nd arguement -> status of the installation exit code 
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo " installing$1 failed "
        exit 1
    else
        echo " installing $1 is successfully "
    fi
}

for package in $@
do
    echo " installing $package "
    dnf list installed $package 
    if [ $? -ne 0 ]; then
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE "installing $package" $?
done 