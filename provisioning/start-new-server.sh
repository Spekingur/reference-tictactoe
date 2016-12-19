#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# I will be using docker-machine to create new aws machines
# ATTN: UNTESTED

# Create an AWS server through docker machine making sure to create in correct region and with correct AMI
# The name of the server is passed through from script or pipeline (e.g. start-new-server.sh acceptance would create the server tictactoe-acceptance)
docker-machine create --driver amazonec2 --amazonec2-region eu-west-1 --amazonec2-ami	ami-9398d3e0 tictactoe-$1

# Installing docker-compose
docker-machine ssh tictactoe-$1 sudo -i && curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && exit

# Copy .env to AWS machine
docker-machine scp ./.env tictactoe-$1:~

# Copy docker-compose.yml to AWS machine
docker-machine scp ./docker-compose.yml tictactoe-$1:~

# Run docker-compose
docker-machine ssh tictactoe-$1 docker-compose up -d
