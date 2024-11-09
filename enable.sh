#/usr/bin/env bash

# Takes two arguments, the name of the service and the instance
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <service> <instance>"
    echo "Example: $0 drive exports"
    exit 1
fi

service=$1
instance=$2

# Enable the service
sudo systemctl enable $service@$instance.service

# Enable the timer
sudo systemctl enable --now $service@$instance.timer
