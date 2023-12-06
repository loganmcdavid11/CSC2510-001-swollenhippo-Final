# Filename: cron_file.sh
# Author: Logan McDavid]
# Last Updated: 12 / 5 / 23
# Purpose: Automate calling the ansible playbook based on 
what environment you would like to run it in

#!/usr/bin/env bash

# Path to my ansible playbooks
playbook_path="/home/jlmcdavid42/ansible-playbooks"

# Ask the user for the environment name
read -p "Enter the environment name (dev, prod, test): " environment_name

# Construct the playbook name based on the environment
playbook_name="${environment_name}_playbook.yml"

# Full path to the playbook file
playbook_file="${playbook_path}/${playbook_name}"

# Check if the playbook file exists
if [ -f "$playbook_file" ]; then
    # Run the playbook
    ansible-playbook "$playbook_file"

    # Check if the playbook was successful or failed
    if [ $? -eq 0 ]; then
        echo "Playbook execution successful."
    else
        echo "Playbook execution failed."
    fi
else
    echo "Error: Playbook not found at ${playbook_file}"
fi
