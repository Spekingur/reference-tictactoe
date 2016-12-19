#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# This script deploys to a production server on AWS
# Production server is always running but website is not available when docker-compose down has running

# We start by taking down the docker-compose container instances
ssh -i ../../.aws/admin-key-pair-euwest1.pem ec2-user@ec2-52-212-119-153.eu-west-1.compute.amazonaws.com docker-compose down

# We then copy the .env file so the docker-compose knows what image to run
scp -i ../../.aws/admin-key-pair-euwest1.pem ../TicTacToe_Commit/.env ec2-user@ec2-52-212-119-153.eu-west-1.compute.amazonaws.com:~/.env

# Copy the docker-compose.yml file so that docker-compose up -d command knows what to do
scp -i ../../.aws/admin-key-pair-euwest1.pem ../TicTacToe_Commit/docker-compose.yml ec2-user@ec2-52-212-119-153.eu-west-1.compute.amazonaws.com:~/docker-compose.yml

# (Re)start the docker-compose instances
ssh -i ../../.aws/admin-key-pair-euwest1.pem ec2-user@ec2-52-212-119-153.eu-west-1.compute.amazonaws.com docker-compose up -d
