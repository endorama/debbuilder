#!/bin/bash

set -euo pipefail

package=$1

trash ${package}/${package}*.dsc || true
trash ${package}/${package}*.tar.gz || true
trash ${package}/${package}*.tar.xz || true
trash ${package}/${package}*_source.changes || true
trash ${package}/${package}*_source.ppa.upload || true
trash ${package}/${package}*.build || true
