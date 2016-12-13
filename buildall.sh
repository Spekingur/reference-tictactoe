#!/bin/sh

rc=$?

#echo "Starting up Docker service..."
#sudo service docker start
#if [[ $rc !=0 ]] ; then
#  echo "Failure!"
#  exit
#else
#  echo "Success!"

#echo Installing npm on server...
#npm install
#if [[ $rc != 0 ]] ; then#
#  echo "Failure! " $rc
#  exit $rc
#else
#  echo "Success!"
#fi

#echo "Installing npm on client..."
#cd client
#npm install
#cd ..
#if [[ $rc != 0 ]] ; then
#  echo "Failure!" $rc
#  exit $rc
#else
#  echo "Success!"
#fi

#echo "Connecting and starting up postgres database..."
#npm run startdockerdb

#echo "Building app..."
#npm run build
#if [ $rc != 0 ] ; then
#  echo "Failure!" $rc
#  exit $rc
#else
#  echo "Success!"
#fi

#echo Testing this

#echo "Removing docker containers..."
#docker rm $(docker ps -a -q)

#echo "Removing docker images..."
#docker rmi $(docker images -q)

#echo "Stopping Docker service..."
#sudo service docker stop
if [ $1 != 100 ]; then
  echo "Not 100"
  exit $rc
else
  echo "Is 100"
fi

echo Test again
