#! /bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r LINE
do
    FILESYSTEM=$(echo "$LINE" | awk '{print $1}')
    TYPE=$(echo "$LINE" | awk '{print $2}')
    SIZE=$(echo "$LINE" | awk '{print $3}')
    USED=$(echo "$LINE" | awk '{print $4}')
    AVAILABLE=$(echo "$LINE" | awk '{print $5}')
    PERCENTAGE=$(echo "$LINE" | awk '{print $6}')
done <<< "$DISK_USAGE"