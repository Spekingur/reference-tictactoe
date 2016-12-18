#!/bin/bash

#echo Cleaning...
#rm -rf ./dist

#echo Creating...
#mkdir ./dist

if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

#
echo Installing npm on server...
npm install --silent
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Failure with code " $rc
  exit $rc
fi
echo Success

#
echo "Installing npm on client..."
(cd client; npm install --silent)
rc=$?
if [[ $rc != 0 ]] ; then
  echo "Failure with code " $rc
  exit $rc
fi
echo Success

#
echo "Building app..."
npm run build --silent
rc=$?
if [ $rc != 0 ] ; then
  echo "Failure with code " $rc
  exit $rc
fi
echo Success

cat > ./build/githash.txt <<_EOF_
$GIT_COMMIT
_EOF_

cat > ./build/.env <<_EOF_
GIT_COMMIT=$GIT_COMMIT
_EOF_

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

cp ./Dockerfile ./build/
cp ./package.json ./build/
#cp ./Dockerfile ./dist/

#cd dist
#ls -l
#ls ../build
cd build
echo Building docker image

docker build -t spekingur/tictactoe:$GIT_COMMIT .

rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker build failed " $rc
    exit $rc
fi

docker push spekingur/tictactoe:$GIT_COMMIT
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker push failed " $rc
    exit $rc
fi

echo "Done"
#echo "Removing docker containers..."
#docker rm $(docker ps -a -q)

#echo "Removing docker images..."
#docker rmi $(docker images -q)

#echo "Stopping Docker service..."
#sudo service docker stop
