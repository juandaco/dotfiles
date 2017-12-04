#!/usr/bin/env bash

# Automation Script to install my 
# configuration files (dotfiles).

# Git configuration file
cp -v gitconfig ~/.gitconfig

# ESLint config file
cp -v eslintrc.json ~/.eslintrc.json

# Initialize a git Repo to track possible changes
cp -v gitignore ~/.vim/.gitignore


#############
#           #
# vim SETUP #
#           #
#############

# Create .vim folder in Home if it doesn't exist.
mkdir -p ~/.vim/ 
mkdir -p ~/.vim/tmp

# Copy the vimrc.
cp -v vimrc ~/.vim/vimrc

# Copy the gvimrc.
cp -v gvimrc ~/.vim/gvimrc

# Install Plug Package manager.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run vim and Install all packages.
vim -c "PlugInstall" "+q" "+q"

cd ~/.vim
if [ ! -d '.git' ];
then
  git init -q
  git add .
  git commit -m "Install commit"
fi

