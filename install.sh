# Install Plug Package manager.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run vim and Install all packages.
vim -c "PlugInstall" "+q" "+q"

