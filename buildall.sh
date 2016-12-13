#!/bin/bash

sudo service docker start

sudo npm install
cd client
sudo npm install
cd ..

npm run startdockerdb
npm run build

sudo service docker stop
