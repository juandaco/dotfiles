#!/usr/bin/env bash

## Automation Script to install my
## configuration files (dotfiles).

## Link Git configuration file
#ln -vf gitconfig ~/.gitconfig

#ln -vf mac_aliases ~/.bash_aliases
#[ "$(uname -s)" = 'Darwin' ] && ln -vf mac_bash_profile ~/.bash_profile

#ln -vf tmux.conf ~/.tmux.conf

##############
##           #
## vim SETUP #
##           #
##############

## Create .vim folder in Home if it doesn't exist.
#mkdir -p ~/.vim/
#mkdir -p ~/.vim/tmp

## Create .config/nvim folder in Home if it doesn't exist.
#mkdir -p ~/.config/nvim/

## Link init.vim
#ln -vf init.vim ~/.config/nvim/init.vim

## Link vimrc.
#ln -vf vimrc ~/.vim/vimrc

## Link the gvimrc.
#ln -vf gvimrc ~/.vim/gvimrc
#ln -vf gvimrc ~/.config/nvim/ginit.vim

## Link packages.vim
#ln -vf packages.vim ~/.vim/packages.vim

## Link pluggins.vim
#ln -vf pluggins.vim ~/.vim/pluggins.vim

## Link mappings.vim
#ln -vf mappings.vim ~/.vim/mappings.vim

## Link functions.vim
#ln -vf functions.vim ~/.vim/functions.vim

## Link functions.vim
#ln -vf general.vim ~/.vim/general.vim

## Link coc-nvim.vim
#ln -vf coc.vim ~/.vim/coc.vim

## Link coc-settings.json
#ln -vf coc-settings.json ~/.vim/coc-settings.json
#ln -vf coc-settings.json ~/.config/nvim/coc-settings.json

## ftplugin
#mkdir -p ~/.vim/ftplugin
#for file in ftplugin/*; do
#  ln -vf "$file" "$HOME/.vim/$file"
#done

## Syntax Modifications
#mkdir -p ~/.vim/after/syntax
#for file in syntax/*; do
#  ln -vf "$file" "$HOME/.vim/after/$file"
#done

## UltiSnips
#mkdir -p ~/.vim/UltiSnips
#for file in UltiSnips/*; do
#  ln -vf "$file" "$HOME/.vim/$file"
#done

## Install Package manager if not installed.
#if [ ! -d ~/.vim/pack/minpac/opt/minpac ]; then
#  printf "Installing Package Manager... \\n"
#  mkdir -p ~/.vim/pack/minpac/opt
#  cd ~/.vim/pack/minpac/opt || echo 'Failed to ' || exit
#  git clone "https://github.com/k-takata/minpac"
#fi

## Run vim and Install all packages.
#$EDITOR -c "packadd minpac | source ~/.vim/packages.vim | redraw | call minpac#update('', { 'do': 'quit' })"

# Make sure bin directory exists
mkdir -p "$HOME/bin"

# Run all installer scripts
for file in ./installers/*; do
  bash "$file"
done
