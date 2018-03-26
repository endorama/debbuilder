#!/bin/bash

set -euo pipefail

package=$1
platform=$2

tag=$(date +%Y%m%d%H%M%S)

docker rmi "debbuilder-${package}-${platform}:latest"

docker build \
	--tag "debbuilder-${package}-${platform}:${tag}" \
	--tag "debbuilder-${package}-${platform}:latest" \
	--file "${package}/${platform}/Dockerfile" \
	--rm --compress \
	${package}
