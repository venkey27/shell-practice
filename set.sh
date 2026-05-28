#! /bin/bash

set -e
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE=$LOGS_DIR/$0.log
TIMESTAMP=$(date "+%Y-%m-%d  %H:%M:%S")
trap 'echo "ERROR at line $LINENO": command: $BASH_COMMAND' ERR
                                                                        
if [ $USERID -ne 0 ]; then
    echo " run the script with ROOT USER "
    exit 1
fi


for package in $@
do
    echo " installing $package "
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
    dnf install $package -y &>> $LOGS_FILE
    
    else
        echo "$TIMESTAMP [Info] $package is already installed ... Skipping" | tee -a $LOGS_FILE
    fi
done 