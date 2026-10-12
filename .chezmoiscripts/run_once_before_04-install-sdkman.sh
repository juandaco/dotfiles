#!/usr/bin/env bash

set -eufo pipefail

# Same location as ~/.bashrc, which is not applied yet on a first run
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"

if [ ! -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
  echo "Installing sdkman..."
  # ~/.bashrc already sources sdkman-init.sh, so skip the rc file update
  curl --proto '=https' --tlsv1.2 -fsSL "https://get.sdkman.io?rcupdate=false" | bash
fi
