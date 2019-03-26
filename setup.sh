#!/bin/bash

#Setup script to put files in correct place
CWD=$(pwd)

echo "Setting up Dotfiles..."

echo "Backing up old files..."
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.tmux.conf ~/.tmux.conf.old
mv -iv ~/.gitconfig ~/.gitconfig.old

echo "Adding symlinks..."
ln -s $CWD/zshrc ~/.zshrc
ln -s $CWD/vimrc ~/.vimrc
ln -s $CWD/tmux.conf ~/.tmux.conf
ln -s $CWD/gitconfig ~/.gitconfig

echo "Done."
