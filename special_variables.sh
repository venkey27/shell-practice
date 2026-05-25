
#! /bin/bash

echo "all the variables passed to the script is $@"
echo "who many variables passed to the script is $#"
echo "first variable is $1"
echo "second variable is $2"
echo "script name $0"
echo "who is running this $USER"
echo "current working directory is $PWD"
echo "home directory $HOME"
echo " PID of the current script $$"
sleep 5 &
echo "PID of the last background process is $!"
echo "line number $LINENO"
echo "sceipt executed in $SECONDS seconds"
echo "exit status of the last command is $?"
echo "random number is $RANDOM"
