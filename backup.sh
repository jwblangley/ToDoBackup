#!/usr/bin/env bash

# Make clear where the log restarts
echo "==========$(date)=========="

# Quit on first non zero rc
set -e

BACKUPNAME="ToDo-$(date '+%Y-%m-%d').md"

if ! [[ -f "records/$BACKUPNAME" ]]
then
    echo "Creating To Do list backup"
    if ! diff records/ToDo-previous.md records/ToDo.md > /dev/null 2>&1
    then
        cp records/ToDo.md records/$BACKUPNAME
        ln -sf $(pwd)/records/$BACKUPNAME records/ToDo-previous.md

        git add records/$BACKUPNAME
        git add records/assets
        git commit -m "Upload $BACKUPNAME"
        git push
        echo "To Do list backup complete"
    else
        echo "No difference with previous ToDo. Skipping"
    fi
else
    echo "Today's backup complete"
fi
