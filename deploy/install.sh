#!/bin/bash
set -e

echo "Installing sft service..."

# Copy service file
cp sft.service /etc/systemd/system/

# Reload systemd
systemctl daemon-reload

# Enable service to start on boot
systemctl enable sft

# Stop existing process if running
pkill -f "sft serve" 2>/dev/null || true

# Start the service
systemctl start sft

echo "Done! Check status with: systemctl status sft"
echo "View logs with: journalctl -u sft -f"
