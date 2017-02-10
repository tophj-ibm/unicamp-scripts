#!/bin/bash

# To use this script to generate a new folder, 
# just change the DOCKER_VERSION and run.
#
# Make sure github.com/tophj-ibm/docker.git has 
# a branch of the version you change it to
#

DEFAULT_DISTRO_VERSIONS=(ubuntu-trusty ubuntu-xenial ubuntu-yakkety) 
DOCKER_VERSION=1.13.1

DIR_NAME="docker-$DOCKER_VERSION"
if [ ! -d "$DIR_NAME" ]; then
	mkdir "$DIR_NAME"
	cd "$DIR_NAME"

	# make a new script for each distro
	for DISTRO in ${DEFAULT_DISTRO_VERSIONS[@]};
	do
		echo "making file for $DISTRO"

		cat > "$DISTRO.sh" <<-EOF
			#!/bin/bash
			apt-get update && apt-get install -y docker-engine

			git clone https://github.com/tophj-ibm/docker.git
			cd docker
			git fetch --all
			git checkout unicamp-v$DOCKER_VERSION
			if DOCKER_BUILD_PKGS=$DISTRO make deb; then
				echo " - - - - - - - - - - - - - - - - - - - - "
				echo ""
				echo " The final deb should be located in : "
				echo " docker/bundles/$DOCKER_VERSION/build-deb/$DISTRO/*.deb "
				echo ""
				echo " Feel free to copy this out to target destination"
				echo ""
				echo " - - - - - - - - - - - - - - - - - - - - "
			fi
		EOF
		
		chmod 755 "$DISTRO.sh"
	done
	
	# make a script for testing all supported distros as well
	echo "making build-script"

	cat > "build-script.sh" <<-EOF
		#!/bin/bash
		apt-get update && apt-get install -y docker-engine

		git clone https://github.com/tophj-ibm/docker.git
		cd docker
		git fetch --all
		git checkout unicamp-v$DOCKER_VERSION
		if make deb ; then
			echo " - - - - - - - - - - - - - - - - - - - - "
			echo ""
			echo " The final 14.04 deb should be located in : "
			echo " docker/bundles/$DOCKER_VERSION/build-deb/ubuntu-trusty/*.deb "
			echo ""
			echo " The final 16.04 deb should be located in : "
			echo " docker/bundles/$DOCKER_VERSION/build-deb/ubuntu-xenial/*.deb "
			echo ""
			echo " The final 16.10 deb should be located in : "
			echo " docker/bundles/$DOCKER_VERSION/build-deb/ubuntu-yakkety/*.deb "
			echo ""
			echo " Feel free to copy this out to target destination"
			echo ""
			echo " - - - - - - - - - - - - - - - - - - - - "
		fi

	EOF
	
	chmod 755 "build-script.sh"

	echo ""
	echo "Done."
	echo ""
fi
if [ -d "$DIR_NAME" ]; then
	echo "Directory $DIR_NAME already exists"
fi
