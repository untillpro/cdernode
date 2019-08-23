#!/bin/bash
set -e
echo "Build go..."
cd ./cder
go build
echo "Create docker image"
cd ..
ver=$(cat version)
if [[ $ver == *"SNAPSHOT"* ]]; then
  echo "Version can't contain SNAPSHOT: $ver"
  exit 1
fi
docker build -t "${DOCKER_LOGIN}"/cdernode:"$ver" .
echo "Push image"
docker push "${DOCKER_LOGIN}"/cdernode:"$ver"
echo 'Change ver in compose file'
sed -i "s/\(cdernode:\)\(.*\)/\1$ver/" docker-compose.yml