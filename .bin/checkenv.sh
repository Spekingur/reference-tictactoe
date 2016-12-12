#!/bin/bash
# Created by Hreidar Olafur Arnarsson
# This script checks if necessary environments are set up.

# Docker checks
echo Checking Docker...
docker ps
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Docker is either not running or not installed. Trying to start..." $rc
  sudo service docker start $rc
  if [[ $rc != 0 ]] ; then
    echo "Docker is not installed. Please install to continue." $rc
    exit $rc
  else
    docker ps
    if [[ $rc != 0 ]] ; then
      echo "Unforeseen Docker error." $rc
      exit $rc
    else
      echo "Docker has been started." $rc
    fi
    exit $rc
  fi
  exit $rc
fi

# Node checks
# Yarn checks
# Nodemon checks
# React checks
