#! /bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then # -z checks if the variable is empty or not # || is used for OR condition
    echo "either <source-dir> or <dest-dir> is empty"
    echo "USAGE: $0 <source-dir> <dest-dir> [days(optional, default to 14)]"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then # -d checks if the directory exists or not # ! is used to negate the condition
    echo "source directory $SOURCE_DIR does not exist"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    echo "destination directory $DEST_DIR does not exist"
    exit 1
fi

FILES=$(find "$SOURCE_DIR" -type f -name "*.log" -mtime +$DAYS)
if [ -z "$FILES" ]; then
    echo "no log files found in $SOURCE_DIR older than $DAYS days"
    exit 0
fi

while IFS= read -r FILE # IFS is used to set the Internal Field Separator to newline character, so that it can handle file names with spaces
do
    echo "$FILE"
done <<< "$FILES"