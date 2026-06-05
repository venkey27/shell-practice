#! /bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r LINE
do
  echo "$LINE"
done <<< "$DISK_USAGE"