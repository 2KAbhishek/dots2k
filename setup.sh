#!/bin/bash

# Fetch submodules
git submodule update --init --recursive

system_kind=""

# Setup script for dots2k
function install_arch {
    sudo pacman -S \
        curl git zsh python vim neovim tmux bat fzf fasd fd exa unzip \
        lsd github-cli git-delta lazygit openssh ranger  \
        thefuck xclip ncdu ripgrep kitty autorandr ttf-firacode-nerd
}

function install_debian {
    sudo apt install \
        curl git zsh vim neovim tmux bat fzf fasd python exa gh ripgrep \
        fd-find unzip thefuck xclip ncdu ranger  kitty autorandr

    sudo ln -sfnv /usr/bin/fdfind /usr/bin/fd
    sudo ln -sfnv /usr/bin/batcat /usr/bin/bat
}

function install_mac {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install asdf bat exa fasd fd fzf gh gotop lazygit lsd ncdu neofetch \
        neovim pastel ripgrep skhd tmux wget yabai iterm2 maccy stats
}

function install_linux {
    # Identify the Linux distribution
    if [[ -f "/etc/os-release" ]]; then
        source /etc/os-release
        if [[ "$ID" == "arch" || "$ID" == "manjaro" || "$ID_LIKE" == *"arch"* ]]; then
            system_kind="Linux_Arch"
            install_arch
        elif [[ "$ID" == "debian" || "$ID_LIKE" == *"debian"* ]]; then
            system_kind="Linux_Debian"
            install_debian
            if [[ "$ID" == "ubuntu" ]]; then
                system_kind="Linux_Debian_Ubuntu"
            fi
            if [[ "$ID" == "linuxmint" ]]; then
                system_kind="Linux_Debian_Mint"
            fi
            if [[ "$ID" == "popos" ]]; then
                system_kind="Linux_Debian_Pop"
            fi
        elif [[ "$ID" == "fedora" ]]; then
            system_kind="Linux_Fedora"
        elif [[ "$ID" == "centos" ]]; then
            system_kind="Linux_CentOS"
        fi
    else
        system_kind="Linux_Unknown"
    fi
}

function install_packages {
    if [[ "$(uname)" == "Linux" ]]; then
        system_kind="Linux"
        install_linux
    elif [[ "$(uname)" == "Darwin" ]]; then
        system_kind="Mac"
        install_mac
    # Check if the system is running Windows
    elif [[ "$(uname -s)" =~ "CYGWIN" ]]; then
        system_kind="Windows_Cygwin"
    elif [[ "$(uname -r)" =~ "Microsoft" ]]; then
        system_kind="Windows_WSL"
    else
        system_kind="Unknown"
    fi
    echo "Installing packages for $system_kind"
}

function install_oh_my_zsh {
    echo -e "\u001b[7m Installing oh-my-zsh...\u001b[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

function install_zsh_plugins {
    echo -e "\u001b[7m Installing zsh plugins...\u001b[0m"
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    git clone https://github.com/marlonrichert/zsh-autocomplete ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/clarketm/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H
    git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
    git clone https://github.com/unixorn/git-extra-commands.git ~/.oh-my-zsh/custom/plugins/git-extra-commands
    git clone https://github.com/Aloxaf/fzf-tab.git ~/.oh-my-zsh/custom/plugins/fzf-tab
    git clone https://github.com/hlissner/zsh-autopair ~/.oh-my-zsh/custom/plugins/zsh-autopair
}

function install_vim_plugins {
    echo -e "\u001b[7m Installing plugin manager \u001b[0m"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo -e "\u001b[7m Installing plugins for vim and nvim... \u001b[0m"
    vim +PlugUpdate +qall
    pip install neovim
    nvim -c UpdateRemotePlugins
}

function install_tmux_plugins {
    echo -e "\u001b[7m Installing tmux plugins... \u001b[0m"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux start-server
    tmux new-session -d
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server
}

function install_extras {
    install_oh_my_zsh
    install_zsh_plugins
    install_vim_plugins
    install_tmux_plugins
}

function backup_configs {
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    bash "$PWD"/scripts/backup_configs.sh
    echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

function setup_symlinks {
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    bash "$PWD"/scripts/setup_symlinks.sh
}

function distro_tweaks {
    echo -e "\u001b[7m Distro specific tweaks... \u001b[0m"
    bash "$PWD"/scripts/distro_tweaks.sh
}

function setup_dotfiles {
    echo -e "\u001b[7m Setting up dots2k... \u001b[0m"
    install_packages
    install_extras
    backup_configs
    setup_symlinks
    distro_tweaks
    echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" ] || [ "$1" = "-a" ]; then
    setup_dotfiles
    exit 0
fi

if [ "$1" = "--install" ] || [ "$1" = "-i" ]; then
    install_packages
    install_extras
    exit 0
fi

if [ "$1" = "--symlinks" ] || [ "$1" = "-s" ]; then
    setup_symlinks
    exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up dots2k...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (0) Setup Everything \u001b[0m"
echo -e "  \u001b[34;1m (1) Install Packages \u001b[0m"
echo -e "  \u001b[34;1m (2) Install Extras \u001b[0m"
echo -e "  \u001b[34;1m (3) Backup Configs \u001b[0m"
echo -e "  \u001b[34;1m (4) Setup Symlinks \u001b[0m"
echo -e "  \u001b[34;1m (5) Distro Tweaks \u001b[0m"
echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"0")
    setup_dotfiles
    ;;

"1")
    install_packages
    ;;

"2")
    install_extras
    ;;

"3")
    backup_configs
    ;;

"4")
    setup_symlinks
    ;;

"5")
    distro_tweaks
    ;;

*)
    echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
    exit 0
    ;;
esac

exit 0
