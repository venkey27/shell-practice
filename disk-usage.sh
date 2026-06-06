#! /bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=70
SERVER_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
while IFS= read -r line # IFS is used to set the Internal Field Separator to newline character, so that it can handle file names with spaces
do
  USAGE=$(echo "$line" | awk '{print $6}' | cut -d'%' -f1)
  PARTITION=$(echo "$line" | awk '{print $7}')
  if [ $USAGE -ge $USAGE_THRESHOLD ]; then
    MESSAGE+="High disk usage alert: $PARTITION is at ${USAGE}% usage.\n"
  fi
done <<< "$DISK_USAGE"

echo -e "$MESSAGE" 

sh mail.sh "Devops Team" "High Disk Usage" "$SERVER_IP" "$MESSAGE" "venkey271200@gmai.com" "High Disk Usage Alert on"
