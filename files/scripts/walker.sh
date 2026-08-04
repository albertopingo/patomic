#!/usr/bin/env bash
set -oue pipefail

elephant service enable

mkdir -p /usr/lib/systemd/user

tee /usr/lib/systemd/user/walker.service << 'EOF'
[Unit]
Description=Walker Application Launcher Service
After=elephant.service
Requires=elephant.service

[Service]
Type=simple
ExecStart=/usr/bin/walker --gapplication-service
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

systemctl --global enable walker.service