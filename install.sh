# Automation Script to install my 
# configuration files (dotfiles).

# Git configuration file
cp -v gitconfig ~/.gitconfig

# ESLint config file
cp -v eslintrc ~/.eslintrc 


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

