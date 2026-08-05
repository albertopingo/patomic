#!/usr/bin/env bash
set -oue pipefail

echo "Rose Pine Icons - Installing"

BUILD_DIR=$(mktemp -d)
TMP=$(mktemp -d)

trap 'rm -rf "$BUILD_DIR" "$TMP"' EXIT

ICONS_URL="https://github.com/rose-pine/gtk/releases/latest/download/rose-pine-icons.tar.gz"
ICON_DEST="/usr/share/icons"

echo "Rose Pine Icons - Curl"
curl -Lo "$BUILD_DIR/rose-pine-icons.tar.gz" "$ICONS_URL"

echo "Rose Pine Icons - Extract"
tar --warning=no-unknown-keyword --no-xattrs -xzf "$BUILD_DIR/rose-pine-icons.tar.gz" -C "$TMP"

echo "Rose Pine Icons - Copy to $ICON_DEST"
rm -rf "$ICON_DEST"
mkdir "$ICON_DEST"
cp -r "$TMP/icons/rose-pine-icons" "$ICON_DEST"
