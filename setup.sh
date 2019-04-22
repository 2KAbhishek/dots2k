#!/bin/bash

#Setup script for Dotfiles
CWD=$(pwd)
arg=$1

echo "\u001b[32;1mSetting up Dotfiles..."

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then

    echo "\u001b[37;1m\u001b[4mSelect an option:"
    echo "  \u001b[34;1m1) for Oh-My-Zsh"
    echo "  \u001b[34;1m2) for Powerlevel9K"
    echo "  \u001b[34;1m3) for Vundle"
    echo "  \u001b[34;1m4) for Custom zsh plugins"
    echo "  \u001b[31;1m0) to Exit"

    read option

    case $option in

    "1")echo "\u001b[7mInstalling Oh-My-Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;

    "2")echo "\u001b[7mInstalling Powerlevel9K..."
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        ;;

    "3")echo "\u001b[7mInstalling Vundle..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        ;;

    "4")echo "\u001b[7mInstalling Custom zsh plugins ..."
        cd ~/.oh-my-zsh/custom/plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zdharma/fast-syntax-highlighting.git
        git clone https://github.com/djui/alias-tips.git
        cd $CWD
        ;;

    "0")echo "\u001b[4m\u001b[44mBye"
        exit 0
        ;;

    *)echo "\u001b[31;1mInvalid option entered."
        exit 1
        ;;
    esac

    exit 0
fi

echo "\u001b[33;1mBacking up old files..."
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.tmux.conf ~/.tmux.conf.old
mv -iv ~/.gitconfig ~/.gitconfig.old

echo "\u001b[36;1mAdding symlinks..."
ln -sv $CWD/.zshrc ~/.zshrc
ln -sv $CWD/.vimrc ~/.vimrc
ln -sv $CWD/.tmux.conf ~/.tmux.conf
ln -sv $CWD/.gitconfig ~/.gitconfig

echo "\u001b[32;1mDone."
