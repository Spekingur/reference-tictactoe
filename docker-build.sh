#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# This script builds a Docker image and pushes it to dockerhub

# Getting git hash and url for later usage
if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

# Removing docker containers and images before starting build
./.bin/docker-remove.sh

# Going to the right directory and then start build
cd build
echo Building docker image

# Building the docker image with git hash as the tag
docker build -t spekingur/tictactoe:$GIT_COMMIT .
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker build failed " $rc
    exit $rc
fi

# Pushing the docker image to dockerhub
docker push spekingur/tictactoe:$GIT_COMMIT
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker push failed " $rc
    exit $rc
fi

echo "Done"
