#!/usr/bin/env bash

set -eu
DOCKER_VERSION=${DOCKER_VERSION:-}

waitForPackage() {
  while fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
    echo "Waiting for other software managers to finish..."
    sleep 1
  done
}

echo "
Package: docker-ce
Pin: version ${DOCKER_VERSION}.*
Pin-Priority: 1000
" > /etc/apt/preferences.d/docker-ce

apt-get -qq update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common \
  bash-completion \
  git

waitForPackage

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -qq update && apt-get -qq install -y docker-ce
