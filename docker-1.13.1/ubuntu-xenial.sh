#!/bin/bash
apt-get update && apt-get install -y docker-engine

git clone https://github.com/tophj-ibm/docker.git
cd docker
git fetch --all
git checkout unicamp-v1.13.1
if DOCKER_BUILD_PKGS=ubuntu-xenial make deb; then
echo " - - - - - - - - - - - - - - - - - - - - "
echo ""
echo " The final deb should be located in : "
echo " docker/bundles/1.13.1/build-deb/ubuntu-xenial/*.deb "
echo ""
echo " Feel free to copy this out to target destination"
echo ""
echo " - - - - - - - - - - - - - - - - - - - - "
fi
