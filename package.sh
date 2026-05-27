#! /bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE=$LOGS_DIR/$0.log
TIMESTAMP=$(date "+%Y-%m-%d  %H:%M:%S")

if [ $USERID -ne 0 ]; then
    echo " run the script with ROOT USER "
    exit 1
fi

# 1st arguement -> whar package we want to install
# 2nd arguement -> status of the installation exit code 
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [eRror] installing$1 failed is a failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$TIMESTAMP [Info] installing $1 is successfully " | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    echo " installing $package "
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE "installing $package" $?
    else
        echo "$TIMESTAMP [Info] $package is already installed ... Skipping" | tee -a $LOGS_FILE
    fi
done 