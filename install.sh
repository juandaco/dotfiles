#!/usr/bin/env bash

# Automation Script to install my
# configuration files (dotfiles).

# Git configuration file
cp -v gitconfig ~/.gitconfig

# ESLint config file
cp -v eslintrc.json ~/.eslintrc.json

#############
#           #
# vim SETUP #
#           #
#############

# Create .vim folder in Home if it doesn't exist.
mkdir -p ~/.vim/
mkdir -p ~/.vim/tmp

# Copy vimrc.
cp -v vimrc ~/.vim/vimrc

# Copy the gvimrc.
cp -v gvimrc ~/.vim/gvimrc

# Copy pluggins.vim
cp -v pluggins.vim ~/.vim/pluggins.vim

# Copy mappings.vim
cp -v mappings.vim ~/.vim/mappings.vim

# Copy functions.vim
cp -v functions.vim ~/.vim/functions.vim

# Install Plug Package manager if not installed.
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  printf "Installing Plug Package Manager... \\n"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Run vim and Install all packages.
vim -c "PlugInstall" "+q" "+q"
