#!/usr/bin/env bash
# shellcheck disable=1090

# Link Git configuration file
ln -vf gitconfig ~/.gitconfig

# Make sure bin directory exists
mkdir -p "$HOME/bin"

# Install bash directories
pushd "$(dirname "$0")/bash" >/dev/null || exit 1

# ~/.pforile
ln -vf ./profile "$HOME/.profile"

# ~/.bash_profile
ln -vf ./bash_profile "$HOME/.bash_profile"

# ~/.bashrc
ln -vf ./bashrc "$HOME/.bashrc"

# ~/.bash_aliases
ln -vf ./bash_aliases "$HOME/.bash_aliases"

popd >/dev/null || exit 1

source "$HOME/.bash_profile"

# Run all installer scripts
for file in ./installers/*; do
  bash "$file"
done
