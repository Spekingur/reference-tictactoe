#!/bin/bash
# Made by Hreiðar Ólafur Arnarsson
# Extracting build scripts and creating a specific build bash script

# Exit script on any error
set -e

# Setting node path to current directory
export NODE_PATH=.

# If the build directory exists, remove it
if [ -d ./build ]; then rm -r ./build; fi

# Recreate the build directory
[ -d build ] || mkdir build

# Build the client with the npm script provided in package.json (was unable to find out how to run react-scripts build with out npm)
# cd ./client && export NODE_PATH=./src/ && react-scripts build
npm run buildclient

# Move the newly built client to another folder in the main build directory
mv client/build build/static

# Copy all server files and folder to the main build directory
cp -R server build/server

# Create a new directory and copy necessary files for framework to main build directory
mkdir -p build/client/src
cp -r client/src/common build/client/src

# Finally copy the files necessary to run the build
cp run.js build
cp runserver.sh build
