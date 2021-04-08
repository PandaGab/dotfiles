#!/bin/sh

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Symlinks dotfiles in the user space
DOTFILES=(.zshrc .custom_aliases .custom_functions .gitconfig .tmux.conf)
for dotfile in $DOTFILES; do
    if [[ -f $HOME/$dotfile ]]; then
        echo "$HOME/$dotfile already exists, remove it manually"
    else
        ln -s "${PWD}/$dotfile" $HOME/$dotfile
    fi
done
