#!/bin/bash

set -euo pipefail

package_name="lastpass-cli"
package_base_path="/buildroot/${package_name}"

cd  "${package_base_path}/src"

cp "${package_base_path}/description-pak" description-pak

checkinstall -y \
	--install=no \
	--type debian \
	--pkgname "${package_name}" \
	--pkgversion "${LASTPASS_VERSION}" \
	--pkgrelease "0ubuntu${PACKAGE_RELEASE_NUMBER}" \
	--pkglicense GPLv2 \
	--provides lpass \
	--maintainer "edoardo.tenani@protonmail.com" \
	--pakdir "/buildroot/dist" \
	--backup=no \
	make install-doc install

chown 1000:1000 /buildroot/dist/*

rm -fr *-pak
