#!/usr/bin/env bash

echo "Enter the HC_PING_KEY:"
read HC_PING_KEY

services=(drive photos syncoid-out)

for service in "${services[@]}"; do
    # Install our templated services and timers
    sudo systemctl enable services/$service@.service
    sudo ln -svf $(pwd)/timers/$service@.timer /etc/systemd/system/$service@.timer

    # Install the configuration file if it doesn't already exist

    if [ ! -f /etc/systemd/system/$service@.service.d/override.conf ]; then
        sudo mkdir -p /etc/systemd/system/$service@.service.d
        sudo tee /etc/systemd/system/$service@.service.d/override.conf <<EOF
[Service]
Environment="HC_PING_KEY=$HC_PING_KEY"
Environment="SYNCOID_OFFSITE_IP=100.72.123.112" # Tailscale IP, unused by non-syncoid services
EOF
    fi

done
