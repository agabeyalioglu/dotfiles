#!/bin/bash
# One-time setup — runs only once per machine

set -e

echo "Running one-time setup..."

# Install Xcode Command Line Tools if missing
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Waiting for installation to complete..."
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
fi

# Accept Xcode license if needed
sudo xcodebuild -license accept 2>/dev/null || true

# Create common directories
mkdir -p ~/Projects
mkdir -p ~/.local/bin

# Enable git maintenance globally
git maintenance start 2>/dev/null || true

echo "One-time setup complete."
