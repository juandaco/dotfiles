#!/usr/bin/env bash

# Link Git configuration file
ln -vf gitconfig ~/.gitconfig

# Tmux configuration
ln -vf tmux.conf ~/.tmux.conf

# Make sure bin directory exists
mkdir -p "$HOME/bin"

# Run all installer scripts
for file in ./installers/*; do
  bash "$file"
done
