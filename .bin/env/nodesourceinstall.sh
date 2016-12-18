#!/bin/bash
# Created by Hreidar Olafur Arnarsson
# Installs NodeJS v6

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# If needed for compliation and installation of native addons from npm
# sudo apt-get install -y build-essential
