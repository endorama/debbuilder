#!/bin/bash

set -euo pipefail

package=$1
platform=$2
version=$3

release_file="./${package}/${platform}/release-${version}"

release=$(cat ${release_file} 2>/dev/null || true)
release=${release:-0}
release=$(($release + 1))

echo "Building ${package} version ${version} (0ubuntu${release}) for ${platform}"

docker run \
	-v ${HOME}/.gnupg/:/home/builder/.gnupg/:ro \
    -v /run/user/$(id -u)/:/run/user/$(id -u)/:ro \
	-v $(pwd):/buildroot \
	-e PACKAGE_VERSION="${version}" \
	-e PACKAGE_RELEASE_NUMBER="${release}" \
	--rm -i \
	-t "debbuilder-${package}-${platform}" \
	/bin/bash -c "/buildroot/${package}/${platform}/build.sh"

echo $release > ${release_file}

echo "Build done"
