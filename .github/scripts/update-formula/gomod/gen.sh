#!/bin/bash
set -eu
# Purpose: generate a forumla for "CycloneDX-gomod" 

UF_REPO='CycloneDX/cyclonedx-gomod'
UF_VERSION="$1"

THIS_DIR="$(realpath "$(dirname "$0")" )"
TMP_DIR="$(mktemp -d "$THIS_DIR/.tmp.fu.XXXXXXXX")"

formula="$(< "$THIS_DIR/template.rb")"

gh release download \
  "v${UF_VERSION}" \
  --repo "$UF_REPO" \
  --pattern "cyclonedx-gomod_${UF_VERSION}_darwin_*.tar.gz" \
  --pattern "cyclonedx-gomod_${UF_VERSION}_linux_*.tar.gz" \
  --dir "$TMP_DIR" \
  1>&2

for _target in 'darwin_amd64' 'darwin_arm64' 'linux_arm64' 'linux_amd64' 
do
  _sha256sum="$(sha256sum -b "${TMP_DIR}/cyclonedx-gomod_${UF_VERSION}_${_target}.tar.gz" | cut -f1 -d' ')"
  formula=${formula//%SHA256SUM_${_target}%/$_sha256sum}
done

rm -rf "$TMP_DIR" 1>&2

echo "${formula//%VERSION%/$UF_VERSION}"
