#!/bin/bash
# Created by Hreidar Olafur Arnarsson
# This script is used to clean up Docker containers and images

# Removing all containers
echo Removing Docker containers
docker rm -f $(docker ps -a -q)

# Wait a bit
sleep 10

# Removing all images
echo Removing Docker images
docker rmi -f $(docker images -q)

# Always exit gracefully
exit 0
