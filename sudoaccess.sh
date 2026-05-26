#! /bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " then please with the ROOT USEr "
    exit 1
fi

echo " installing mysql server "
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo " mysql installation failed "
    exit 1
else
    echo " mysql is successfully installed "
fi