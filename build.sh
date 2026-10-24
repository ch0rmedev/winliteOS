#!/bin/sh
set -eu
cd "$(dirname "$0")"

if [ "$(id -u)" -ne 0 ]; then
  echo "Run this script with sudo: sudo ./build.sh" >&2
  exit 1
fi

if ! command -v lb >/dev/null 2>&1; then
  echo "live-build is missing. Install build tools from README.md first." >&2
  exit 1
fi

lb clean --purge
lb config
lb build

printf '\nBuild finished. ISO should be: %s/live-image-amd64.hybrid.iso\n' "$PWD"
