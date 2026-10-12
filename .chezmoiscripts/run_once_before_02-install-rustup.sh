#!/usr/bin/env bash

set -eufo pipefail

# Same locations as ~/.profile, which is not applied yet on a first run
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.config/rustup}"
export CARGO_HOME="${CARGO_HOME:-$HOME/.config/cargo}"

if ! command -v rustup >/dev/null 2>&1 && [ ! -x "$CARGO_HOME/bin/rustup" ]; then
  echo "Installing rustup..."
  # ~/.profile already adds $CARGO_HOME/bin to PATH
  curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi
