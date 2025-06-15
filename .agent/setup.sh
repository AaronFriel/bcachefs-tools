#!/usr/bin/env bash
set -euo pipefail

# Install packages needed to build and test bcachefs-tools
sudo apt-get update
sudo apt-get install -y \
    pkg-config libaio-dev libblkid-dev libkeyutils-dev liblz4-dev \
    libsodium-dev liburcu-dev libzstd-dev uuid-dev zlib1g-dev \
    valgrind libudev-dev udev git build-essential python3 \
    python3-docutils libclang-dev debhelper dh-python systemd-dev \
    libscrypt-dev libfuse3-dev

# Install a recent Rust toolchain if rustup is not present
if ! command -v rustup >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- -y --no-modify-path
    source "$HOME/.cargo/env"
fi
