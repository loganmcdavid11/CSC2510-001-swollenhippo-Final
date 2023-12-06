# Filename: cron_file.sh
# Author: Logan McDavid]
# Last Updated: 12 / 5 / 23
# Purpose: Schedule a cron job for a playbook that will run every minute

#!/usr/bin/env bash

# Ask user which playbook they want to have a cron job for
echo "Which playbook would you like to schedule a cron jon for? (dev/test/prod):"
read env

# Saves path to desired playbook
running_command="/home/jlmcdavid42/ansible_playbooks/${env}_playbook"

# Schedules a cron job for every minute for that playbook
(crontab -l ; echo "* * * * * $running_command") | crontab -

# Checks to see if the cron job was successful or not
if crontab -l | grep -q "$running_command"
then
    echo "Cron job added successfully."
else
    echo "Failed to add cron job."
fi
