#!/bin/bash

sudo service docker start

npm install
cd client
npm install
cd ..

npm run startdockerdb
npm run build

sudo service docker stop
