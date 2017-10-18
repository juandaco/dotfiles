# Script to install your dotfiles in the Home Directory.

# Create .vim folder in Home if it doesn't exist.
mkdir -p ~/.vim/ 
mkdir -p ~/.vim/tmp

# Copy the vimrc.
echo "Copying vimrc:"
cp -vi vimrc ~/.vim/vimrc

# Copy the gvimrc.
echo "Copying vimrc:"
cp -vi gvimrc ~/.vim/gvimrc

# Install Plug Package manager.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run vim and Install all packages.
vim -c "PlugInstall" "+q" "+q"

