#!/bin/bash
set -eu
# Purpose: print latest release of "CycloneDX-cli" 

UF_REPO='CycloneDX/cyclonedx-cli'

gh release view --repo "$UF_REPO" --json tagName --jq .tagName
