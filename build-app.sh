#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# Prepares and builds the app

# Need to install npm for server to be able to build
echo Installing npm on server...
npm install --silent
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Failure with code " $rc
  exit $rc
fi
echo Success

# Also need to install npm for client to be able to build
echo "Installing npm on client..."
(cd client; npm install --silent)
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Failure with code " $rc
  exit $rc
fi
echo Success

# Building the app by calling the build script
echo "Building app..."
./build.sh
rc=$?
if [ $rc != 0 ] ; then
  echo "Failure with code " $rc
  exit $rc
fi
echo Success
