#!/bin/bash
# Created by Hreidar Olafur Arnarsson
# Checks whether nodemon is installed

nodemon --version

rc = $?
if [[ $rc != 0]] ; then
  echo "Nodemon is not installed."
  exit
fi
