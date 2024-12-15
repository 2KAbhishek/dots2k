#!/usr/bin/env bash

LOCAL_CONFIG="$HOME/.config/shell/local.sh"

declare -a common_packages=(
    curl wget git zsh tmux bat fzf eza unzip neovim ripgrep ncdu ranger vim zoxide
)

install_arch() {
    sudo pacman -S "${common_packages[@]}" github-cli fd git-delta lazygit ttf-firacode-nerd wl-clipboard topgrade
}

install_fedora() {
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install "${common_packages[@]}" gh lazygit fd-find wl-clipboard git-delta
}

install_debian() {
    sudo apt install "${common_packages[@]}" gh fd-find xclip autorandr nala
    sudo ln -sfnv /usr/bin/fdfind /usr/bin/fd
    sudo ln -sfnv /usr/bin/batcat /usr/bin/bat
    echo "alias cat=batcat" >>"$LOCAL_CONFIG"
}

install_termux() {
    pkg install "${common_packages[@]}" gh fd git-delta openssh termux-tools nala
    ln -sfnv "$PWD/../config/bin" "$HOME"/bin
    cp -rv "$PWD/../config/.termux" "$HOME"/
}

get_system_info() {
    [ -e /etc/os-release ] && source /etc/os-release && echo "${ID:-Unknown}" && return
    [ -e /etc/lsb-release ] && source /etc/lsb-release && echo "${DISTRIB_ID:-Unknown}" && return
    [ "$(uname)" == "Darwin" ] && echo "mac" && return
    [ "$(uname -o)" == "Android" ] && echo "termux" && return
}

install_packages() {
    system_kind=$(get_system_info)
    echo -e "\u001b[7m Installing packages for $system_kind...\u001b[0m"

    color=""
    case $system_kind in
    manjaro) color="040" && install_arch ;;
    arch) color="033" && install_arch ;;
    ubuntu) color="202" && install_debian ;;
    debian) color="163" && install_debian ;;
    fedora | fedora-asahi-remix) color="32" && install_fedora ;;
    pop) color="045" && install_debian ;;
    kali) color="254" && install_debian ;;
    termux) color="040" && install_termux ;;
    mac) color="254" ;;
    *) echo "Unknown system!" && exit 1 ;;
    esac

    echo "export POWERLEVEL9K_OS_ICON_BACKGROUND='$color'" >>"$LOCAL_CONFIG"
    echo "export POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{238}╰%F{$color}%K{$color}%F{black} 󰅂%f%F{$color}%k%f'" >>"$LOCAL_CONFIG"

    mkdir -p "$HOME/.local/state/vim/undo"
}

install_oh_my_zsh() {
    echo -e "\u001b[7m Installing oh-my-zsh and plugins...\u001b[0m"

    zsh_dir="$HOME/.config/zsh"
    export ZDOTDIR="$zsh_dir"

    sh -c "$(curl -fsSL https://install.ohmyz.sh)" "" --unattended --keep-zshrc

    gh="https://github.com/"
    omz="$zsh_dir/ohmyzsh/custom"
    omz_plugin="$omz/plugins/"
    mkdir -p $omz_plugin

    git clone "$gh/romkatv/powerlevel10k" "$omz/themes/powerlevel10k" --depth 1

    cd "$omz_plugin" || exit
    git clone "$gh/zsh-users/zsh-autosuggestions"
    git clone "$gh/clarketm/zsh-completions"
    git clone "$gh/z-shell/F-Sy-H"
    git clone "$gh/djui/alias-tips"
    git clone "$gh/unixorn/git-extra-commands"
    git clone "$gh/Aloxaf/fzf-tab"
    git clone "$gh/hlissner/zsh-autopair"
    # git clone "$gh/marlonrichert/zsh-autocomplete"
    cd - || exit

    chsh -s "$(which zsh)"
}

install_extras() {
    install_oh_my_zsh
}

declare -a config_dirs=(
    "autorandr" "bat" "bundle" "cmus" "delta" "fish" "fontconfig" "gitignore.global"
    "htop" "kitty" "lazygit" "libinput-gestures.conf" "mise" "ranger" "shell" "tmux"
    "zsh" "sysinfo.conkyrc" "topgrade.toml" "bluetuith" "alacritty"
)

declare -a home_files=(
    "zsh/.zshenv" ".bashrc" ".dircolors" ".dmenurc" ".gitconfig" ".inputrc" ".luarc.json"
    ".prettierrc" ".pryrc" ".pystartup" ".reek.yml" ".stylua.toml" ".typos.toml"
    ".vimrc" ".Xresources"
)

backup_configs() {
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    for dir in "${config_dirs[@]}"; do
        mv -v "$HOME/.config/$dir" "$HOME/.config/$dir.old"
    done
    for file in "${home_files[@]}"; do
        mv -v "$HOME/$file" "$HOME/$file.old"
    done
    echo -e "\u001b[36;1m Done backing up files as '.old'! . \u001b[0m"
}

setup_symlinks() {
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    for dir in "${config_dirs[@]}"; do
        ln -sfnv "$PWD/config/$dir" "$HOME/.config/"
    done
    for file in "${home_files[@]}"; do
        ln -sfnv "$PWD/config/$file" "$HOME"/
    done
}

setup_dotfiles() {
    echo -e "\u001b[7m Setting up dots2k... \u001b[0m"
    backup_configs
    setup_symlinks
    install_packages
    install_extras
    echo -e "\u001b[7m Done! \u001b[0m"
}

show_menu() {
    echo -e "\u001b[32;1m Setting up your env with dots2k...\u001b[0m"
    echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
    echo -e "  \u001b[34;1m (0) Setup Everything \u001b[0m"
    echo -e "  \u001b[34;1m (1) Backup Current Configs \u001b[0m"
    echo -e "  \u001b[34;1m (2) Setup Symlinks \u001b[0m"
    echo -e "  \u001b[34;1m (3) Install Packages \u001b[0m"
    echo -e "  \u001b[34;1m (4) Install Extras \u001b[0m"
    echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"
    echo -en "\u001b[32;1m ==> \u001b[0m"

    read -r option
    case $option in
    "0") setup_dotfiles ;;
    "1") backup_configs ;;
    "2") setup_symlinks ;;
    "3") install_packages ;;
    "4") install_extras ;;
    *) echo -e "\u001b[31;1m alvida and adios! \u001b[0m" && exit 0 ;;
    esac
}

main() {
    case "$1" in
    -a | --all | a | all) setup_dotfiles ;;
    -i | --install | i | install) setup_symlinks && install_packages && install_extras ;;
    -s | --symlinks | s | symlinks) setup_symlinks ;;
    *) show_menu ;;
    esac
    exit 0
}

main "$@"
