#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# This script runs all necessary scripts to build the app and create an image

# Building the app
./build-app.sh

# Preparing files for docker build
./docker-prepare.sh

# Build a docker image and upload it to dockerhub
./docker-build.sh

echo "Done"
