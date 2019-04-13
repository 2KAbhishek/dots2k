#!/bin/bash

#Setup script for Dotfiles
CWD=$(pwd)
arg=$1

echo "Setting up Dotfiles..."

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then

    echo "Select an option:"
    echo "1 for Oh-My-Zsh"
    echo "2 for Powerlevel9K"
    echo "3 for Vundle"
    echo "4 for Custom zsh plugins"
    echo "0 to Exit"

    read option

    case $option in

    "1")echo "Installing Oh-My-Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;

    "2")echo "Installing Powerlevel9K..."
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        ;;

    "3")echo "Installing Vundle..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        ;;

    "4")echo "Installing Custom zsh plugins ..."
        cd ~/.oh-my-zsh/custom/plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zdharma/fast-syntax-highlighting.git
        git clone https://github.com/djui/alias-tips.git
        cd $CWD
        ;;

    "0")echo "Bye"
        exit 0
        ;;

    *)echo "Invalid option entered."
        exit 1
        ;;
    esac

    exit 0
fi

echo "Backing up old files..."
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.tmux.conf ~/.tmux.conf.old
mv -iv ~/.gitconfig ~/.gitconfig.old

echo "Adding symlinks..."
ln -s $CWD/.zshrc ~/.zshrc
ln -s $CWD/.vimrc ~/.vimrc
ln -s $CWD/.tmux.conf ~/.tmux.conf
ln -s $CWD/.gitconfig ~/.gitconfig

echo "Done."
