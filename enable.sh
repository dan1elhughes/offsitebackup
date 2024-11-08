#/usr/bin/env bash

# Takes one argument, the name of the path
if [ -z "$1" ]; then
    echo "Usage: $0 <path>"
    echo "Example: $0 exports (referring to /media/backups/exports)"
    exit 1
fi

instance=$1

# Enable the drive@ service
sudo systemctl enable services/drive@$instance.service

# Enable the timer
sudo systemctl enable --now timers/daily@$instance.timer
