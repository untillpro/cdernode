# Overview

- cdernode deploys git repos to containers using `cder`
- git repo can be node.js or static website

# Usage

# Build

- git clone --recurse-submodules https://github.com/untillpro/cdernode
- git checkout --recurse-submodules tags/v0.1.0

# Docker

## Prerequisites

- env `DOCKER_LOGIN`
- installed `Docker`
- installed `Golang`
- installed `qs`

## Usage

- build new version with `qs r`
- exec `build.sh` to create and upload
