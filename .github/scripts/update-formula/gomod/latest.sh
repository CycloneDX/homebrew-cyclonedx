#!/bin/bash
set -eu
# Purpose: print latest release of "CycloneDX-gomod" 

UF_REPO='CycloneDX/cyclonedx-gomod'

gh release view --repo "$UF_REPO" --json tagName --jq .tagName
