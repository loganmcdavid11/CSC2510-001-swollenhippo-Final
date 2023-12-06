# Filename: env_script.sh
# Author: Logan McDavid
# Last Updated: 12 / 5 / 23
# Purpose: This file is copied and named "clonescript.sh" on servers
# that will clone a git repository of their choice

#!/usr/bin/env bash

# Debugging line
# echo "Starting script..."

# Pin ssh key
eval "$(ssh-agent -s)"

# Print contents of private key for debugging
# cat /home/jlmcdavid/.ssh/id_ed25519

# Add key to ssh key directory
ssh-add /home/jlmcdavid42/.ssh/id_ed25519

# Debugging line
# echo "Private key added to SSH agent."

# Set permissions to clone repository
sudo chown -R jlmcdavid42:jlmcdavid42 /var/www/html

# Clone your git repository
git clone git@github.com:ttu-bburchfield/swollenhippofinal.git

# Checkout to branch of your choice
git checkout $1
