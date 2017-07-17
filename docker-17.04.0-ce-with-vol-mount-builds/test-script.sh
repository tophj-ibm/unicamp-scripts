#!/bin/bash
apt-get update && apt-get install -y docker-engine

git clone https://github.com/tophj-ibm/moby.git
cd moby
git fetch --all
git checkout unicamp-v17.04.0-ce-with-volume-mount-builds
DOCKER_BUILD_PKGS=ubuntu-trusty make deb
echo " - - - - - - - - - - - - - - - - - - - - "
echo ""
echo " The final 14.04 deb should be located in : "
echo " moby/bundles/latest/build-deb/ubuntu-trusty/*.deb "
echo ""
echo " Feel free to copy this out to target destination"
echo ""
echo " - - - - - - - - - - - - - - - - - - - - "

