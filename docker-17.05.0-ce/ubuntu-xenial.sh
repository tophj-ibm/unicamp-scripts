#!/bin/bash
apt-get update && apt-get install -y docker-engine

git clone https://github.com/tophj-ibm/docker.git
cd docker
git fetch --all
git checkout unicamp-v17.05.0-ce
if DOCKER_BUILD_PKGS=ubuntu-xenial make deb; then
echo " - - - - - - - - - - - - - - - - - - - - "
echo ""
echo " The final deb should be located in : "
echo " docker/bundles/17.05.0-ce/build-deb/ubuntu-xenial/*.deb "
echo ""
echo " Feel free to copy this out to target destination"
echo ""
echo " - - - - - - - - - - - - - - - - - - - - "
fi
