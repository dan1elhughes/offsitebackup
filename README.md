# `offsitebackup`

Systemd unit files for my offsite backups, not intended for reuse.

# `install.sh`

Set up the templates.

# `enable.sh <remote> <directory>`

Installs the service to backup `/media/backups/directory` to `remote:directory` using rclone.

Schedules a daily run, pinging Healthchecks.io on progress.

# `run.sh <remote> <directory>`

Runs a backup immediately and prints logs.
