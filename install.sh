#!/usr/bin/env bash

# Automation Script to install my
# configuration files (dotfiles).

# Link Git configuration file
ln -vf gitconfig ~/.gitconfig

[ "$(uname -s)" = 'Darwin' ] && ln -vf mac_aliases ~/.bash_aliases
[ "$(uname -s)" = 'Darwin' ] && ln -vf mac_bash_profile ~/.bash_profile

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

# Link packages.vim
ln -vf packages.vim ~/.vim/packages.vim
ln -vf packages.vim ~/.config/nvim/packages.vim

# Link pluggins.vim
ln -vf pluggins.vim ~/.vim/pluggins.vim
ln -vf pluggins.vim ~/.config/nvim/pluggins.vim

# Link mappings.vim
ln -vf mappings.vim ~/.vim/mappings.vim
ln -vf mappings.vim ~/.config/nvim/mappings.vim

# Link functions.vim
ln -vf functions.vim ~/.vim/functions.vim
ln -vf functions.vim ~/.config/nvim/functions.vim

# ftplugin
mkdir -p ~/.vim/ftplugin
for file in ftplugin/*; do
  ln -vf "$file" "$HOME/.vim/$file"
done

# UltiSnips
mkdir -p ~/.vim/UltiSnips
for file in UltiSnips/*; do
  ln -vf "$file" "$HOME/.vim/$file"
done

# Install Plug Package manager if not installed.
if [ ! -d ~/.vim/pack/minpac/opt/minpac ]; then
  printf "Installing Plug Package Manager... \\n"
  mkdir -p ~/.vim/pack/minpac/opt
  cd ~/.vim/pack/minpac/opt || echo 'Failed to ' || exit
  git clone https://github.com/k-takata/minpac
fi

# Run vim and Install all packages.
vim -c "packadd minpac | source ~/.vim/packages.vim | redraw | call minpac#update('', { 'do': 'quit' })"

