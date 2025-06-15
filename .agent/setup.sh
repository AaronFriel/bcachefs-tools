#!/usr/bin/env bash
set -euo pipefail

# Install packages required for building and testing bcachefs-tools
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential git pkg-config python3 \
    libaio-dev libblkid-dev libkeyutils-dev liblz4-dev \
    libsodium-dev liburcu-dev libzstd-dev uuid-dev zlib1g-dev \
    libudev-dev libclang-dev

# Install a recent Rust toolchain if rustup/cargo are missing
if ! command -v cargo >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
        sh -s -- -y --no-modify-path
    source "$HOME/.cargo/env"
fi

# Build the C library required by Rust tests
make libbcachefs.a
