#!/usr/bin/env bash

dir="/etc/systemd/system"

echo "Enter the HC_PING_KEY:"
read HC_PING_KEY

services=(drive photos syncoid-out)

for service in "${services[@]}"; do
    # Copy our templated services and timers
    sudo cp -v services/$service@.service $dir
    sudo cp -v timers/$service@.timer $dir

    # Install the configuration file for the service

    sudo mkdir -p $dir/$service@.service.d
    sudo tee $dir/$service@.service.d/override.conf <<EOF
[Service]
Environment="HC_PING_KEY=$HC_PING_KEY"
Environment="SYNCOID_OFFSITE_IP=100.72.123.112"
EOF

done
