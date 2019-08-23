# Overview

- cdernode deploys git repos to containers using `cder`
- git repo can be node.js or static website

# Usage

- See `docker-compose.yml` as an example
  - Change repo and traefik rules


# Build

## Prerequisites

- env `DOCKER_LOGIN`
- installed `Docker`
- installed `Golang`
- installed `qs`

## Tag Version

- git clone --recurse-submodules https://github.com/untillpro/cdernode
- build new version with `qs r`

## Create Docker Container

- git checkout --recurse-submodules tags/v0.1.0
- exec `bash build.sh` to create and upload
