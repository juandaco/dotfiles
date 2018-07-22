#!/usr/bin/env bash

# Automation Script to install my
# configuration files (dotfiles).

# Link Git configuration file
ln -vf gitconfig ~/.gitconfig

# Link ESLint config file
ln -vf eslintrc.json ~/.eslintrc.json

[ "$(uname -s)" = 'Darwin' ] && ln -vf mac_aliases ~/.bash_aliases

#############
#           #
# vim SETUP #
#           #
#############

# Create .vim folder in Home if it doesn't exist.
mkdir -p ~/.vim/
mkdir -p ~/.vim/tmp

# Create .config/nvim folder in Home if it doesn't exist.
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/tmp

# Link vimrc.
ln -vf vimrc ~/.vim/vimrc
ln -vf vimrc ~/.config/nvim/init.vim

# Link the gvimrc.
ln -vf gvimrc ~/.vim/gvimrc
ln -vf gvimrc ~/.config/nvim/ginit.vim

# Link pluggins.vim
ln -vf pluggins.vim ~/.vim/pluggins.vim
ln -vf pluggins.vim ~/.config/nvim/pluggins.vim

# Link mappings.vim
ln -vf mappings.vim ~/.vim/mappings.vim
ln -vf mappings.vim ~/.config/nvim/mappings.vim

# Link functions.vim
ln -vf functions.vim ~/.vim/functions.vim
ln -vf functions.vim ~/.config/nvim/functions.vim

# Install Plug Package manager if not installed.
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  printf "Installing Plug Package Manager... \\n"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Run vim and Install all packages.
vim -c "PlugInstall" "+q" "+q"
