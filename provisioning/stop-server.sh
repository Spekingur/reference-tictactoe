#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# I will be using docker-machine to create new aws machines
# ATTN: UNTESTED

# Stop shut down on any error
set -e

# Closing docker instance on docker-machine gracefully, might be unecessary
docker-machine ssh tictactoe-$1 docker-compose down

# Shutting down the docker-machine
docker-machine stop tictactoe-$1

# Removing the docker-machine
docker-machine rm -y tictactoe-$1
