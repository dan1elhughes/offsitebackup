#/usr/bin/env bash

# Takes two arguments, the name of the service and the instance name
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <service> <instance>"
    echo "Example: $0 drive exports"
    exit 1
fi

service=$1
instance=$2

sudo systemctl start --no-block $service@$instance.service && journalctl -u $service@$instance.service -fb
