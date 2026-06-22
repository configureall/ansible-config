#!/bin/bash

set -e

sudo apt update -y
sudo apt install -y fontconfig openjdk-21-jre
java -version

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins

echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl restart jenkins

sudo apt update -y
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible


echo ""
echo "===== Versions ====="
java -version
ansible --version

echo ""
echo "===== Jenkins Status ====="
sudo systemctl status jenkins --no-pager

echo ""
echo "===== Jenkins Initial Password ====="
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo ""
echo "Open:"
echo "http://<EC2-PUBLIC-IP>:8080"
