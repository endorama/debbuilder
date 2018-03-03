#!/bin/bash

set -euo pipefail

package=$1
platform=$2
version=${3:-"v1.2.2"}

echo "Building lastpass-cli version $version for $platform"

pushd src
git checkout $version
popd

release=$(cat ./$platform/release)
release=$(($release + 1))

docker run \
	-v $(pwd):/buildroot\
	-e LASTPASS_VERSION="${version:1}" \
	-e PACKAGE_RELEASE_NUMBER="${release}" \
	--rm \
	-i \
	-t debbuilder-lastpass-cli:$platform \
	/bin/bash -c /buildroot/$platform/build.sh

echo $release > "./${platform}/release"

echo "Build done"
