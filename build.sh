#!/bin/bash
set -e

ver=$(cat version)
if [[ $ver == *"SNAPSHOT"* ]]; then
  echo "Version can't contain SNAPSHOT: $ver"
  exit 1
fi

echo "Building cder..."
cd ./cder
go build
echo "Creating docker image..."
cd ..
docker build -t "${DOCKER_LOGIN}"/cdernode:v"$ver" .
echo "Pushing image..."
docker push "${DOCKER_LOGIN}"/cdernode:v"$ver"
#echo 'Changing ver in compose file'
#sed -i "s/\(cdernode:\)\(.*\)/\1$ver/" docker-compose.yml