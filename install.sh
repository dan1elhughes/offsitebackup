#!/usr/bin/env bash

echo "Enter the HC_PING_KEY:"
read HC_PING_KEY

remotes=(drive photos)

for remote in "${remotes[@]}"; do
    # Install our templated services and timers
    sudo systemctl enable services/$remote@.service
    sudo ln -svf $(pwd)/timers/$remote@.timer /etc/systemd/system/$remote@.timer

    # Install the configuration file if it doesn't already exist

    if [ ! -f /etc/systemd/system/$remote@.service.d/override.conf ]; then
        sudo mkdir -p /etc/systemd/system/$remote@.service.d
        sudo tee /etc/systemd/system/$remote@.service.d/override.conf <<EOF
[Service]
Environment="HC_PING_KEY=$HC_PING_KEY"
EOF
    fi

done

