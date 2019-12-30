#!/usr/bin/env bash

# Automation Script to install my
# configuration files (dotfiles).

# Link Git configuration file
ln -vf gitconfig ~/.gitconfig

ln -vf mac_aliases ~/.bash_aliases
[ "$(uname -s)" = 'Darwin' ] && ln -vf mac_bash_profile ~/.bash_profile

ln -vf tmux.conf ~/.tmux.conf

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

# Link init.vim
ln -vf init.vim ~/.config/nvim/init.vim

# Link vimrc.
ln -vf vimrc ~/.vim/vimrc

# Link the gvimrc.
ln -vf gvimrc ~/.vim/gvimrc
ln -vf gvimrc ~/.config/nvim/ginit.vim

# Link packages.vim
ln -vf packages.vim ~/.vim/packages.vim

# Link pluggins.vim
ln -vf pluggins.vim ~/.vim/pluggins.vim

# Link mappings.vim
ln -vf mappings.vim ~/.vim/mappings.vim

# Link functions.vim
ln -vf functions.vim ~/.vim/functions.vim

# Link functions.vim
ln -vf general.vim ~/.vim/general.vim

# Link coc-nvim.vim
ln -vf coc-nvim.vim ~/.vim/coc-nvim.vim

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

# Install Package manager if not installed.
if [ ! -d "$HOME/.local/share/dein" ]; then
  printf "Installing Package Manager... \\n"
  mkdir -p "$HOME/.local/share/dein"
  git clone https://github.com/Shougo/dein.vim "$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim"
fi

OS="$(uname -s)"
if [[ $OS =~ "Darwin" ]]; then
  # MacOS
  command -v fzf >> /dev/null || brew install fzf
  command -v fzf >> /dev/null || "$(brew --prefix)/opt/fzf/install"
  command -v fd >> /dev/null || brew install fd
  command -v bat >> /dev/null || brew install bat

elif [[ $OS =~ "Linux" ]]; then
  #Linux

  # Create bin folder in user if it doesn't exist.
  mkdir -p ~/bin

  # Install fzf
  if [ ! -d ~/.fzf ];then
    # Install fzf when not present
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  else
    # Update if needed
    pushd ~/.fzf >> /dev/null || exit
    git fetch origin
    if [ -n "$(git log HEAD..origin/master --oneline)" ]; then
      git pull
      ./install
    fi
    popd >> /dev/null || exit
  fi


  # Install fd
  if [ -z "$(command -v fd)" ]; then
    pushd ~/bin >> /dev/null || exit

    FD_PACKAGE_VERSION='v7.4.0'

    if [[ $(uname -m) =~ 'arm' ]]; then
      # Raspberry Pi
      FD_PACKAGE_NAME="fd-$FD_PACKAGE_VERSION-arm-unknown-linux-gnueabihf"
      wget "https://github.com/sharkdp/fd/releases/download/$FD_PACKAGE_VERSION/$FD_PACKAGE_NAME.tar.gz"
      tar -xzf "$FD_PACKAGE_NAME.tar.gz" && rm "$FD_PACKAGE_NAME.tar.gz"
      cp "$FD_PACKAGE_NAME/fd" .
      cp "$FD_PACKAGE_NAME/autocomplete/fd.bash-completion" /etc/bash_completion.d/
      rm -rf "$FD_PACKAGE_NAME"
    else
      # Regular Linux
      FD_PACKAGE_NAME="fd_${FD_PACKAGE_VERSION:1}_amd64.deb"
      wget "https://github.com/sharkdp/fd/releases/download/$FD_PACKAGE_VERSION/$FD_PACKAGE_NAME"
      sudo dpkg -i "$FD_PACKAGE_NAME"
      rm -rf "$FD_PACKAGE_NAME"
    fi

    popd >> /dev/null || exit
  fi

  # Install bat
  if [ -z "$(command -v bat)" ]; then
    pushd ~/bin >> /dev/null || exit

    BAT_PACKAGE_VERSION="v0.12.1"

    if [[ $(uname -m) =~ 'arm' ]]; then
      # Raspberry Pi
      BAT_PACKAGE_NAME="bat-$BAT_PACKAGE_VERSION-arm-unknown-linux-gnueabihf"
      wget "https://github.com/sharkdp/bat/releases/download/$BAT_PACKAGE_VERSION/$BAT_PACKAGE_NAME.tar.gz"
      tar -xzf "$BAT_PACKAGE_NAME.tar.gz" && rm "$BAT_PACKAGE_NAME.tar.gz"
      cp "$BAT_PACKAGE_NAME/bat" .
      rm -rf "$BAT_PACKAGE_NAME"
    else
      # Regular Linux
      BAT_PACKAGE_NAME="bat_${BAT_PACKAGE_VERSION:1}_amd64.deb"
      wget "https://github.com/sharkdp/bat/releases/download/$BAT_PACKAGE_VERSION/$BAT_PACKAGE_NAME"
      sudo dpkg -i "$BAT_PACKAGE_NAME"
      rm -rf "$BAT_PACKAGE_NAME"
    fi
    popd >> /dev/null || exit
  fi
fi

# Install all vim packages. Manually run call dein#update() one time.
vim -c "try | call dein#update() | finally | qall! | endtry" \
	-N -u "$HOME/.vim/vimrc" -U NONE -i NONE -V1 -e -s

