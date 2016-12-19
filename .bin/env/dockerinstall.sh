#!/bin/bash
# Created by Hreidar Olafur Arnarsson
# Installs docker
# Assumes environment is Ubuntu 16.04 LTS (Xenial)

# Prerequisites
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

# Docker install
sudo apt-get update
sudo apt-get install docker-engine                # installing Docker
sudo service docker start                         # starting Docker service
sudo docker run hello-world                       # test run to see that Docker works
