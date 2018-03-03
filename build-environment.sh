#!/bin/bash

set -euo pipefail

package=$1
platform=$2

docker build \
	--label "debbuilder-${package}" \
	--tag "${platform}" \
	--file "${package}/${platform}/Dockerfile" \
	--rm
