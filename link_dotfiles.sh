#!/bin/sh

# Symlinks dotfiles in the user space
ln -s "${PWD}/.custom_aliases" $HOME/.custom_aliases
ln -s "${PWD}/.custom_functions" $HOME/.custom_functions
ln -s "${PWD}/.tmux.conf" $HOME/.tmux.conf
ln -s "${PWD}/.zshrc" $HOME/.zshrc
ln -s "${PWD}/.gitconfig" $HOME/.gitconfig
