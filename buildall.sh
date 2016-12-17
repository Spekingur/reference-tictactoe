#!/bin/bash

#rc=$?

#echo "Starting up Docker service..."
#sudo service docker start
#if [[ $rc !=0 ]] ; then
#  echo "Failure!"
#  exit
#else
#  echo "Success!"

echo Installing npm on server...
npm install
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Failure with code " $rc
  exit $rc
fi

echo "Installing npm on client..."
cd client
npm install
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Failure with code " $rc
  exit $rc
fi
cd ..

#echo "Connecting and starting up postgres database..."
#npm run startdockerdb

echo "Building app..."
npm run build
rc=$?
if [ $rc != 0 ] ; then
  echo "Failure with code " $rc
  exit $rc
fi

#echo Testing this

#echo "Removing docker containers..."
#docker rm $(docker ps -a -q)

#echo "Removing docker images..."
#docker rmi $(docker images -q)

#echo "Stopping Docker service..."
#sudo service docker stop
#if [ $1 != 100 ]; then
#  echo "Not 100"
#  exit $rc
#else
#  echo "Is 100"
#fi

#echo Test again
