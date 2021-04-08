#!/bin/sh

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# On compute server, might need to had this path to grant access to zsh functions
# export FPATH="/cvmfs/soft.computecanada.ca/nix/var/nix/profiles/16.09/share/zsh/5.2/functions:$FPATH"

# Symlinks dotfiles in the user space
DOTFILES=(.zshrc .custom_aliases .custom_functions .gitconfig .tmux.conf)
for dotfile in $DOTFILES; do
    if [[ -f $HOME/$dotfile ]]; then
        echo "$HOME/$dotfile already exists, remove it manually"
    else
        ln -s "${PWD}/$dotfile" $HOME/$dotfile
    fi
done
