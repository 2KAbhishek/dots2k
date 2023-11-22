#!/bin/bash

declare -a common_packages=(
    curl wget git zsh tmux bat fzf eza unzip neovim
    lsd ripgrep ncdu ranger vim vifm zoxide
)

function install_arch {
    sudo pacman -S "${common_packages[@]}" github-cli fd git-delta lazygit ttf-firacode-nerd wl-clipboard
}

function install_debian {
    sudo apt install "${common_packages[@]}" gh fd-find xclip autorandr
    sudo ln -sfnv /usr/bin/fdfind /usr/bin/fd
    sudo ln -sfnv /usr/bin/batcat /usr/bin/bat
    echo "alias cat=batcat" >>~/.local.sh
}

function install_mac {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install "${common_packages[@]}" gh fd pastel skhd yabai iterm2 maccy stats
    ln -sfn "$PWD/../config/.yabairc" "$HOME/.yabairc"
    ln -sfn "$PWD/../config/.skhdrc" "$HOME/.skhdrc"
    ln -sfn "$PWD/../config/iterm.sh" "$HOME/.local/bin/iterm"
    ln -sfn "$PWD/../dots2k/config/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/"
}

function install_termux {
    pkg install "${common_packages[@]}" gh fd git-delta openssh termux-tools
    ln -sfnv "$PWD/../config/bin" ~/bin
    cp -rv "$PWD/../config/.termux" ~/
}

get_system_info() {
    [ -e /etc/os-release ] && source /etc/os-release && echo "${ID:-Unknown}" && return
    [ -e /etc/lsb-release ] && source /etc/lsb-release && echo "${DISTRIB_ID:-Unknown}" && return
    [ "$(uname)" == "Darwin" ] && echo "mac" && return
    [ "$(uname -o)" == "Android" ] && echo "termux" && return
}

function install_packages {
    system_kind=$(get_system_info)
    echo -e "\u001b[7m Installing packages for $system_kind...\u001b[0m"

    color=""
    case $system_kind in
    manjaro) color="040" && install_arch ;;
    arch) color="033" && install_arch ;;
    ubuntu) color="202" && install_debian ;;
    debian) color="163" && install_debian ;;
    pop) color="045" && install_debian ;;
    kali) color="254" && install_debian ;;
    mac) color="254" && install_mac ;;
    termux) color="040" && install_termux ;;
    *) echo "Unknown system!" && exit 1 ;;
    esac

    echo "POWERLEVEL9K_OS_ICON_BACKGROUND='$color'" >>~/.local.sh
    echo "POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{238}╰%F{$color}%K{$color}%F{black}  %f%F{$color}%k%f'" >>~/.local.sh
}

function install_oh_my_zsh {
    echo -e "\u001b[7m Installing oh-my-zsh...\u001b[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo -e "\u001b[7m Installing zsh plugins...\u001b[0m"
    gh="https://github.com/"
    omz="$HOME/.oh-my-zsh/custom"
    omz_plugin="$omz/plugins/"

    git clone "$gh/romkatv/powerlevel10k" "$omz/themes/powerlevel10k"
    git clone "$gh/marlonrichert/zsh-autocomplete" "$omz_plugin/zsh-autocomplete"
    git clone "$gh/zsh-users/zsh-autosuggestions" "$omz_plugin/zsh-autosuggestions"
    git clone "$gh/clarketm/zsh-completions" "$omz_plugin/zsh-completions"
    git clone "$gh/z-shell/F-Sy-H" "$omz_plugin/F-Sy-H"
    git clone "$gh/djui/alias-tips" "$omz_plugin/alias-tips"
    git clone "$gh/unixorn/git-extra-commands" "$omz_plugin/git-extra-commands"
    git clone "$gh/Aloxaf/fzf-tab" "$omz_plugin/fzf-tab"
    git clone "$gh/hlissner/zsh-autopair" "$omz_plugin/zsh-autopair"
}

function install_vim_plugins {
    echo -e "\u001b[7m Installing plugin manager \u001b[0m"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo -e "\u001b[7m Installing plugins for vim... \u001b[0m"
    vim +PlugUpdate +qall
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
    install_vim_plugins
    install_tmux_plugins
}

declare -a config_dirs=(
    "autorandr" "bat" "broot" "bundle" "cmus" "delta" "fish" "fontconfig" "gitignore.global"
    "htop" "i3" "i3status" "kitty" "lazygit" "xplr" "libinput-gestures.conf" "ranger"
    "shell" "sysinfo.conkyrc" "topgrade.toml"
)

declare -a home_files=(
    ".bashrc" ".dircolors" ".dmenurc" ".gitconfig" ".inputrc" ".luarc.json" ".prettierrc"
    ".pryrc" ".pystartup" ".stylua.toml" ".tmux.conf" ".vimrc" ".Xresources" ".zshrc"
)

function backup_configs {
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    for dir in "${config_dirs[@]}"; do
        mv -v "$HOME/.config/$dir" "$HOME/.config/$dir.old"
    done
    for file in "${home_files[@]}"; do
        mv -v "$HOME/$file" "$HOME/$file.old"
    done
    echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

function setup_symlinks {
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    for dir in "${config_dirs[@]}"; do
        ln -sfnv "$PWD/config/$dir" "$HOME/.config/"
    done
    for file in "${home_files[@]}"; do
        ln -sfnv "$PWD/config/$file" ~/
    done
}

function setup_dotfiles {
    echo -e "\u001b[7m Setting up dots2k... \u001b[0m"
    install_packages
    install_extras
    backup_configs
    setup_symlinks
    echo -e "\u001b[7m Done! \u001b[0m"
}

main() {
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
    echo -e "\u001b[32;1m Setting up your env with dots2k...\u001b[0m"
    echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
    echo -e "  \u001b[34;1m (0) Setup Everything \u001b[0m"
    echo -e "  \u001b[34;1m (1) Install Packages \u001b[0m"
    echo -e "  \u001b[34;1m (2) Install Extras \u001b[0m"
    echo -e "  \u001b[34;1m (3) Backup Configs \u001b[0m"
    echo -e "  \u001b[34;1m (4) Setup Symlinks \u001b[0m"
    echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"
    echo -en "\u001b[32;1m ==> \u001b[0m"

    read -r option

    case $option in
    "0") setup_dotfiles ;;
    "1") install_packages ;;
    "2") install_extras ;;
    "3") backup_configs ;;
    "4") setup_symlinks ;;
    *) echo -e "\u001b[31;1m alvida and adios! \u001b[0m" && exit 0 ;;
    esac

    exit 0
}

main "$@"
