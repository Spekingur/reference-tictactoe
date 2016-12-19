#!/bin/bash
# Created by Hreidar Olafur Arnarsson
# Installs docker-compose with sudo

sudo -i
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
