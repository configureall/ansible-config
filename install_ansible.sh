#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisites
sudo apt install -y software-properties-common

# Add the official Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Verify the installation
echo -e "\n=== Verification ==="
ansible --version
echo -e "====================\n"
