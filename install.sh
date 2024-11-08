#!/usr/bin/env bash

# Enable the drive@ service

sudo systemctl enable services/drive@.service

# Install the configuration file
echo "Enter the HC_PING_KEY:"
read HC_PING_KEY
sudo mkdir -p /etc/systemd/system/drive@.service.d
sudo tee /etc/systemd/system/drive@.service.d/override.conf <<EOF
[Service]
Environment="HC_PING_KEY=$HC_PING_KEY"
EOF

# Enable the timer
sudo systemctl enable timers/drive@.timer
