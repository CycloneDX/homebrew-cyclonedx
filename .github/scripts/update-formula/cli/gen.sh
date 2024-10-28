#!/bin/bash
set -e
# Purpose: generate a forumla for "CycloneDX-gomod" 

UF_REPO='CycloneDX/cyclonedx-cli'
UF_VERSION="$1"

THIS_DIR="$(realpath "$(dirname "$0")" )"
TMP_DIR="$(mktemp -d "$THIS_DIR/.tmp.fu.XXXXXXXX")"

formula="$(< "$THIS_DIR/template.rb")"

gh release download \
  "v${UF_VERSION}" \
  --repo "$UF_REPO" \
  --pattern "cyclonedx-osx-*" \
  --pattern "cyclonedx-linux-*" \
  --dir "$TMP_DIR" \
  1>&2

for _target in 'osx-x64' 'osx-arm64' 'linux-arm64' 'linux-arm' 'linux-x64'
do
  _sha256sum="$(sha256sum -b "${TMP_DIR}/cyclonedx-${_target}" | cut -f1 -d' ')"
  formula=${formula//%SHA256SUM_${_target}%/$_sha256sum}
done

rm -rf "$TMP_DIR" 1>&2

echo "${formula//%VERSION%/$UF_VERSION}"
