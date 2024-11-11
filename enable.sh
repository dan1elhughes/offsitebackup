#/usr/bin/env bash

# Takes two arguments, the name of the service and the instance
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <service> <instance>"
    echo "Example: $0 drive exports"
    exit 1
fi

service=$1
instance=$2

# Enable the timer to run at boot
sudo systemctl enable $service@$instance.timer

# Start the timer for the current boot
sudo systemctl start $service@$instance.timer
