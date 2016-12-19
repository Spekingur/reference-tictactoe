#!/bin/bash
# Made by Hreidar Olafur Arnarsson
# Creates and copies necessary files before docker image is built

echo Starting preparation...

# Getting git hash and git url for .env and versioning file
if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Adding git hash into various files
cat > ./build/githash.txt <<_EOF_
$GIT_COMMIT
_EOF_

# This will be used for docker-compose
cat > .env <<_EOF_
GIT_COMMIT=$GIT_COMMIT
_EOF_

# Creating directory for version info and writing HTML version file to there
mkdir ./build/public
cat > ./build/public/version.html <<_EOF_
<!doctype html>
<head>
   <title>App version information</title>
</head>
<body>
   <span>Origin:</span> <span>$GITHUB_URL</span>
   <span>Revision:</span> <span>$GIT_COMMIT</span>
   <p>
   <div><a href="$GITHUB_URL/commits/$GIT_COMMIT">History of current version</a></div>
</body>
_EOF_

# Move necessary files to build directory
cp ./Dockerfile ./build/
cp ./package.json ./build/

echo Done
