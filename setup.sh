#!/bin/bash

#Setup script for Dotfiles
CWD=$(pwd)
arg=$1

echo -e "\u001b[32;1mSetting up Dotfiles...\u001b[0m"

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then

    echo -e "\u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
    echo -e "  \u001b[34;1m1) for Oh-My-Zsh\u001b[0m"
    echo -e "  \u001b[34;1m2) for Powerlevel10K\u001b[0m"
    echo -e "  \u001b[34;1m3) for Vundle\u001b[0m"
    echo -e "  \u001b[34;1m4) for Custom zsh plugins\u001b[0m"
    echo -e "  \u001b[31;1m0) to Exit\u001b[0m"

    read option

    case $option in

    "1")echo -e "\u001b[7mInstalling Oh-My-Zsh...\u001b[0m"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;

    "2")echo -e "\u001b[7mInstalling Powerlevel10K...\u001b[0m"
        git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
        ;;

    "3")echo -e "\u001b[7mInstalling Vundle...\u001b[0m"
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        ;;

    "4")echo -e "\u001b[7mInstalling Custom zsh plugins ...\u001b[0m"
        cd ~/.oh-my-zsh/custom/plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zdharma/fast-syntax-highlighting.git
        git clone https://github.com/djui/alias-tips.git
        cd $CWD
        ;;

    "0")echo -e "\u001b[4m\u001b[44mBye\u001b[0m"
        exit 0
        ;;

    *)echo -e "\u001b[31;1mInvalid option entered.\u001b[0m"
        exit 1
        ;;
    esac

    exit 0
fi

echo -e "\u001b[33;1mBacking up old files...\u001b[0m"
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.tmux.conf ~/.tmux.conf.old
mv -iv ~/.gitconfig ~/.gitconfig.old

echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
ln -sfnv $CWD/.zshrc ~/.zshrc
ln -sfnv $CWD/.vimrc ~/.vimrc
ln -sfnv $CWD/.tmux.conf ~/.tmux.conf
ln -sfnv $CWD/.gitconfig ~/.gitconfig

echo -e "\u001b[32;1mDone.\u001b[0m"
