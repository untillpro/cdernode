#!/bin/bash
set -e
echo "Build go..."
cd ./cder
go build
echo "Create docker image"
cd ..
version=$(git describe --abbrev=0)
docker build -t "${DOCKER_LOGIN}"/cdernode:"$version" .
echo "Push image"
docker push "${DOCKER_LOGIN}"/cdernode:"$version"
echo 'Change version in compose file'
sed -i "s/\(cdernode:\)\(.*\)/\1$version/" docker-compose.yml