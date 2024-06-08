#!/usr/bin/env bash

# Helper script to run Ansible playbooks
# Taken from mrover-ros (thanks Quintin)

if [ "$#" -le 0 ]; then
    echo "Usage: $0 <playbook> <extra argument>"
    exit 1
fi

sudo -v # Ensure Ansible has sudo permission

ansible-playbook -i "localhost," -c local ./ansible/"$1" --extra-vars "$2"

