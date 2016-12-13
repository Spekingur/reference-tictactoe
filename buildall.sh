#!/bin/bash

sudo service docker start

sudo npm install
cd client
sudo npm install
cd ..

npm run startdockerdb
sudo npm run build

docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
sudo service docker stop
