#!/usr/bin/env bash
set -euo pipefail
IFS=$' \n\t'

LOCAL_CONFIG_DIR="$HOME/.config/shell"
LOCAL_CONFIG="$LOCAL_CONFIG_DIR/local.sh"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR/config"

mkdir -p "$LOCAL_CONFIG_DIR"

declare -a common_packages=(
    curl wget git zsh tmux bat fzf unzip neovim ripgrep ncdu ranger vim zoxide
)

declare -a pacman_desktop_packages=(
    eza github-cli fd git-delta lazygit ttf-firacode-nerd wl-clipboard openssh base-devel gcc
)

declare -a arch_extra_packages=(
    "${pacman_desktop_packages[@]}" mise debugedit fakeroot
)

declare -a steamos_extra_packages=(
    "${pacman_desktop_packages[@]}" glibc
)

declare -a fedora_extra_packages=(
    eza gh lazygit fd-find wl-clipboard git-delta gcc
)

declare -a debian_extra_packages=(
    exa gh fd-find xclip autorandr nala gcc
)

declare -a termux_extra_packages=(
    eza gh fd git-delta openssh termux-tools nala gcc
)

declare -a config_dirs=(
    "autorandr" "bat" "bundle" "cmus" "delta" "fish" "fontconfig" "gitignore.global"
    "htop" "kitty" "lazygit" "libinput-gestures.conf" "mise" "ranger" "shell" "tmux"
    "zsh" "sysinfo.conkyrc" "topgrade.toml" "bluetuith" "alacritty"
)

declare -a home_files=(
    "zsh/.zshenv" ".bashrc" ".dircolors" ".dmenurc" ".gitconfig" ".inputrc"
    ".prettierrc" ".pryrc" ".pystartup" ".reek.yml" ".typos.toml"
    ".vimrc" ".Xresources" ".editorconfig"
)

append_once() {
    local file="$1" marker="$2"
    shift 2
    if [[ -f "$file" ]] && grep -Fq "$marker" "$file"; then
        return
    fi
    printf '%s\n' "$@" >>"$file"
}

append_powerlevel9k_local() {
    append_once "$LOCAL_CONFIG" "# dots2k: powerlevel9k" \
        "export POWERLEVEL9K_OS_ICON_BACKGROUND='$color'" \
        "export POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{238}╰%F{$color}%K{$color}%F{black} 󰅂%f%F{$color}%k%f'"
}

backup_if_exists() {
    local path="$1"
    if [[ -e "$path" || -L "$path" ]]; then
        mv -v "$path" "${path}.old"
    fi
}

symlink_into() {
    local src_root="$1"
    local dest_root="$2"
    shift 2
    local name
    for name in "$@"; do
        ln -sfnv "$src_root/$name" "$dest_root"
    done
}

get_system_info() {
    [ -e /etc/os-release ] && source /etc/os-release && echo "${ID:-Unknown}" && return
    [ -e /etc/lsb-release ] && source /etc/lsb-release && echo "${DISTRIB_ID:-Unknown}" && return
    [ "$(uname)" == "Darwin" ] && echo "mac" && return
    [ "$(uname -o)" == "Android" ] && echo "termux" && return
}

install_arch() {
    sudo pacman -S "${common_packages[@]}" "${arch_extra_packages[@]}"
    rm -rf /tmp/yay-bin
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    (cd /tmp/yay-bin && makepkg -si --noconfirm)
    yay -S topgrade-bin --noconfirm
}

install_steamos() {
    sudo steamos-readonly disable
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    sudo pacman-key --populate holo
    sudo pacman -S "${common_packages[@]}" "${steamos_extra_packages[@]}"
    sudo steamos-readonly enable
}

install_fedora() {
    sudo dnf copr enable atim/lazygit -y
    sudo dnf copr enable alternateved/eza -y
    sudo dnf install "${common_packages[@]}" "${fedora_extra_packages[@]}" --skip-unavailable
}

install_debian() {
    sudo apt-get update
    sudo apt-get install -y "${common_packages[@]}" "${debian_extra_packages[@]}"
    sudo ln -sfnv /usr/bin/fdfind /usr/bin/fd
    sudo ln -sfnv /usr/bin/batcat /usr/bin/bat
    sudo ln -sfnv /usr/bin/exa /usr/bin/eza
    append_once "$LOCAL_CONFIG" "# dots2k: debian batcat" "alias cat=batcat"
}

install_termux() {
    pkg install "${common_packages[@]}" "${termux_extra_packages[@]}"
    ln -sfnv "$CONFIG_DIR/bin" "$HOME/bin"
    cp -rv "$CONFIG_DIR/.termux" "$HOME/"
}

install_unknown() {
    echo "Unknown system detected: $system_kind"
    echo "Please select a system type to use for package installation:"
    echo "1) Arch Linux (arch, archarm, manjaro)"
    echo "2) Debian/Ubuntu (ubuntu, debian, pop, kali)"
    echo "3) Fedora (fedora, fedora-asahi-remix)"
    echo "4) Termux"
    echo -en "\u001b[32;1m ==> \u001b[0m"

    read -r selection
    case $selection in
    1) color="033" && install_arch ;;
    2) color="163" && install_debian ;;
    3) color="32" && install_fedora ;;
    4) color="040" && install_termux ;;
    *) echo "Invalid selection, exiting." && exit 1 ;;
    esac
}

install_packages() {
    system_kind=$(get_system_info)
    echo -e "\u001b[7m Installing packages for $system_kind...\u001b[0m"

    color=""
    case $system_kind in
    arch) color="033" && install_arch ;;
    archarm) color="033" && install_arch ;;
    manjaro) color="040" && install_arch ;;
    steamos | holo) color="033" && install_steamos ;;
    debian) color="163" && install_debian ;;
    kali) color="254" && install_debian ;;
    pop) color="045" && install_debian ;;
    ubuntu) color="202" && install_debian ;;
    fedora | fedora-asahi-remix) color="32" && install_fedora ;;
    termux) color="040" && install_termux ;;
    mac) color="254" ;;
    *) install_unknown ;;
    esac

    append_powerlevel9k_local

    mkdir -p "$HOME/.local/state/vim/undo"
}

backup_configs() {
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    for dir in "${config_dirs[@]}"; do
        backup_if_exists "$HOME/.config/$dir"
    done
    for file in "${home_files[@]}"; do
        backup_if_exists "$HOME/$file"
    done
    echo -e "\u001b[36;1m Done backing up files as '.old'! . \u001b[0m"
}

setup_symlinks() {
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    symlink_into "$CONFIG_DIR" "$HOME/.config/" "${config_dirs[@]}"
    symlink_into "$CONFIG_DIR" "$HOME/" "${home_files[@]}"
}

setup_dotfiles() {
    echo -e "\u001b[7m Setting up dots2k... \u001b[0m"
    backup_configs
    setup_symlinks
    install_packages
    echo -e "\u001b[7m Done! \u001b[0m"
}

show_menu() {
    echo -e "\u001b[32;1m Setting up your env with dots2k...\u001b[0m"
    echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
    echo -e "  \u001b[34;1m (0) Setup Everything \u001b[0m"
    echo -e "  \u001b[34;1m (1) Backup Current Configs \u001b[0m"
    echo -e "  \u001b[34;1m (2) Setup Symlinks \u001b[0m"
    echo -e "  \u001b[34;1m (3) Install Packages \u001b[0m"
    echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

    local option=""
    while [[ -z "${option}" ]]; do
        echo -en "\u001b[32;1m ==> \u001b[0m"
        read -r option
    done
    case $option in
    "0") setup_dotfiles ;;
    "1") backup_configs ;;
    "2") setup_symlinks ;;
    "3") install_packages ;;
    *) echo -e "\u001b[31;1m alvida and adios! \u001b[0m" && exit 0 ;;
    esac
}

usage() {
    cat <<'EOF'
Usage: setup.sh [OPTION]

  -a, --all       Backup, symlink, install packages
  -i, --install   Symlink + packages only
  -s, --symlinks  Symlinks only
  -h, --help      Show this help

  No option: interactive menu
EOF
}

main() {
    case "${1:-}" in
    -a | --all | a | all) setup_dotfiles ;;
    -i | --install | i | install) setup_symlinks && install_packages ;;
    -s | --symlinks | s | symlinks) setup_symlinks ;;
    -h | --help | h | help) usage ;;
    "") show_menu ;;
    *)
        usage >&2
        exit 1
        ;;
    esac
    exit 0
}

main "$@"
