#!/usr/bin/env bash
set -oue pipefail

# Add Cursor's repository
tee /etc/yum.repos.d/cursor.repo << 'EOF'
[cursor]
name=Cursor
baseurl=https://downloads.cursor.com/yumrepo
enabled=1
gpgcheck=1
gpgkey=https://downloads.cursor.com/keys/anysphere.asc
EOF

# Install Cursor
dnf check-update &&
dnf install cursor