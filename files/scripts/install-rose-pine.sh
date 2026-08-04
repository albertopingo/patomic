#!/usr/bin/env bash
set -oue pipefail

echo "Installing Rose Pine icons..."

THEME_NAME="Rosepine-Dark"
BUILD_DIR=$(mktemp -d)
ICONS_URL="https://github.com/rose-pine/gtk/releases/latest/download/rose-pine-icons.tar.gz"
# THEME_GTK3_URL="https://github.com/rose-pine/gtk/releases/latest/download/gtk3.tar.gz"
# THEME_GTK4_URL="https://github.com/rose-pine/gtk/releases/latest/download/gtk4.tar.gz"

curl -Lo "$BUILD_DIR/rose-pine-icons.tar.gz" "$ICONS_URL"
tar -xzf "$BUILD_DIR/rose-pine-icons.tar.gz" -C /usr/share

rm -rf "$BUILD_DIR"