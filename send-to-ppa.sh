#!/bin/bash

set -euo pipefail

package=$1
platform=$2
version=$3

release_file="./${package}/${platform}/release-${version}"

release=$(cat ${release_file} 2>/dev/null || true)
release=${release:-0}
release="0ubuntu${release}"

echo "Uploading ${package} version ${version} (${release}) for ${platform}"

dput ppa:endorama/${package} ${package}/${package}_${version}-${release}_source.changes
