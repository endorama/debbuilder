#!/bin/bash

set -euo pipefail

package_name="lastpass-cli"
package_base_path="/buildroot/${package_name}"
deb_version=${PACKAGE_VERSION}-0ubuntu${PACKAGE_RELEASE_NUMBER}

checkout_git_version() {
	git checkout "v${PACKAGE_VERSION}"
}

update_changelog() {
	cat <<EOS > debian/changelog.new
lastpass-cli (${deb_version}) $(lsb_release -cs); urgency=medium

  * Manual package build for PPA, git tag v${PACKAGE_VERSION}

 -- Edoardo Tenani <edoardo.tenani@protonmail.com>  $(date -R)

EOS
	cat debian/changelog >> debian/changelog.new
	mv debian/changelog.new debian/changelog
}

git_tag_relase() {
	local version
	version=$1
	git config user.email "edoardo.tenani@protonmail.com"
	git config user.name "Edoardo Tenani"
	git add debian/changelog
	git commit -m "update changelog"
	git tag | grep ${version} && git tag -d ${version}
	git tag ${version}
}

build_deb() {
	debuild --no-tgz-check -S -sa
}


cd  "${package_base_path}/src"

checkout_git_version
update_changelog
git_tag_relase ${deb_version}
build_deb
