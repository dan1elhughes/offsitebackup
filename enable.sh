#/usr/bin/env bash

# Takes two arguments, the name of the remote and the top backups path to the local directory
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <remote> <local>"
    echo "Example: $0 drive exports"
    exit 1
fi

remote=$1
instance=$2

# Enable the service
sudo systemctl enable $remote@$instance.service

# Enable the timer
sudo systemctl enable --now daily@$remote@$instance.timer
