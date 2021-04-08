#!/bin/sh

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# On compute server, might need to had this path to grant access to zsh functions
# export FPATH="/cvmfs/soft.computecanada.ca/nix/var/nix/profiles/16.09/share/zsh/5.2/functions:$FPATH"

# Installation will create a zshrc config file, we will remove it
rm "${PWD}/.zshrc"

# Symlinks dotfiles in the user space
ln -s "${PWD}/.custom_aliases" $HOME/.custom_aliases
ln -s "${PWD}/.custom_functions" $HOME/.custom_functions
ln -s "${PWD}/.tmux.conf" $HOME/.tmux.conf
ln -s "${PWD}/.zshrc" $HOME/.zshrc
ln -s "${PWD}/.gitconfig" $HOME/.gitconfig