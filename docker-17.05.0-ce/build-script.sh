#!/bin/bash
apt-get update && apt-get install -y docker-engine

git clone https://github.com/tophj-ibm/docker.git
cd docker
git fetch --all
git checkout unicamp-v17.05.0-ce
if make deb ; then
echo " - - - - - - - - - - - - - - - - - - - - "
echo ""
echo " The final 14.04 deb should be located in : "
echo " docker/bundles/17.05.0-ce/build-deb/ubuntu-trusty/*.deb "
echo ""
echo " The final 16.04 deb should be located in : "
echo " docker/bundles/17.05.0-ce/build-deb/ubuntu-xenial/*.deb "
echo ""
echo " The final 16.10 deb should be located in : "
echo " docker/bundles/17.05.0-ce/build-deb/ubuntu-yakkety/*.deb "
echo ""
echo " Feel free to copy this out to target destination"
echo ""
echo " - - - - - - - - - - - - - - - - - - - - "
fi

