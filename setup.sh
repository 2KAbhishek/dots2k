#!/usr/bin/env bash
IFS=$' \n\t'

current_dir="${BASH_SOURCE[0]%/*}"
[[ "$current_dir" == "${BASH_SOURCE[0]}" || "$current_dir" == "." ]] && current_dir="$PWD"
readonly current_dir
CONFIG_DIR="$current_dir/config"
LOCAL_SH_CONFIG="$CONFIG_DIR/shell/local.sh"

declare -a common_packages=(
    bat curl fzf git ncdu neovim nodejs npm python python-pip ranger ripgrep tmux unzip vim wget zoxide zsh
)

declare -a pacman_desktop_packages=(
    base-devel eza fd gcc git-delta github-cli lazygit openssh tree-sitter-cli ttf-firacode-nerd wl-clipboard
)

declare -a arch_extra_packages=(
    "${pacman_desktop_packages[@]}" debugedit fakeroot mise
)

declare -a steamos_extra_packages=(
    "${pacman_desktop_packages[@]}" glibc
)

declare -a fedora_extra_packages=(
    eza fd-find gcc gh git-delta lazygit wl-clipboard
)

declare -a debian_extra_packages=(
    autorandr exa fd-find gcc gh nala xclip
)

declare -a termux_extra_packages=(
    eza fd gcc gh git-delta nala openssh termux-tools
)

declare -a gh_extensions=(
    "dlvhdr/gh-dash" "2kabhishek/gh-repo-man" "2kabhishek/gh-sec-man"
)

declare -a config_dirs=(
    "alacritty" "autorandr" "bat" "bluetuith" "bundle" "cmus" "fish"
    "fontconfig" "git" "htop" "kitty" "lazygit" "libinput-gestures.conf"
    "mise" "ranger" ".ripgreprc" "shell" "sysinfo.conkyrc" "tmux" "topgrade.toml" "zsh"
)

declare -a home_files=(
    ".bashrc" ".dircolors" ".dmenurc" ".editorconfig"
    ".inputrc" ".prettierrc" ".profile" ".pryrc" ".pystartup" ".reek.yml" ".typos.toml"
    ".vimrc" ".zshenv" ".Xresources"
)

append_once() {
    local file="$1" marker="$2"
    shift 2
    if [[ -f "$file" ]] && grep -Fq "$marker" "$file"; then
        return
    fi
    mkdir -p "$(dirname "$file")"
    printf '%s\n' "$marker" "$@" >>"$file"
}

append_powerlevel9k_local() {
    append_once "$LOCAL_SH_CONFIG" "# dots2k: powerlevel9k" \
        "export POWERLEVEL9K_OS_ICON_BACKGROUND='$color'" \
        "export POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{238}╰%F{$color}%K{$color}%F{black} 󰅂%f%F{$color}%k%f'"
}

backup_if_exists() {
    local path="$1"
    if [[ -L "$path" ]]; then
        local target
        target="$(readlink -f "$path" 2>/dev/null || true)"
        if [[ "$target" == "$CONFIG_DIR"* ]]; then
            return 0
        fi
    fi
    if [[ -e "$path" || -L "$path" ]]; then
        rm -rf "${path}.old" 2>/dev/null || true
        mv -v "$path" "${path}.old"
    fi
}

symlink_into() {
    local src_root="$1"
    local dest_root="$2"
    shift 2

    local name
    for name in "$@"; do
        local src="$src_root/$name"
        local dst="$dest_root/$name"

        mkdir -p "$(dirname "$dst")"
        ln -sfnv "$src" "$dst"
    done
}

get_system_info() {
    case "$OSTYPE" in
        darwin*) echo "mac" && return ;;
        *android*) echo "termux" && return ;;
    esac
    [ -e /etc/os-release ] && source /etc/os-release && echo "${ID:-Unknown}" && return
    [ -e /etc/lsb-release ] && source /etc/lsb-release && echo "${DISTRIB_ID:-Unknown}" && return
    [ "$(uname)" == "Darwin" ] && echo "mac" && return
    [ "$(uname -o 2>/dev/null)" == "Android" ] && echo "termux" && return
    echo "unknown"
}

install_arch() {
    sudo pacman -S --needed --noconfirm "${common_packages[@]}" "${arch_extra_packages[@]}"
    if ! command -v yay &>/dev/null; then
        rm -rf /tmp/yay-bin
        git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
        (cd /tmp/yay-bin && makepkg -si --noconfirm)
        rm -rf /tmp/yay-bin
    fi
    if command -v yay &>/dev/null; then
        yay -S --needed --noconfirm topgrade-bin 2>/dev/null || true
    fi
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
    append_once "$LOCAL_SH_CONFIG" "# dots2k: debian batcat" "alias cat=batcat"
}

install_termux() {
    pkg install "${common_packages[@]}" "${termux_extra_packages[@]}"
    ln -sfnv "$CONFIG_DIR/bin" "$HOME/bin"
    cp -rv "$CONFIG_DIR/.termux" "$HOME/"
}

install_unknown() {
    echo "Unknown system detected: $system_kind"
    echo "Please select a system type to use for package installation:"
    echo "1) Arch Linux (arch, cachyos, archarm, manjaro)"
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
    arch | cachyos) color="033" && install_arch ;;
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
    install_gh_extensions

    mkdir -p "$HOME/.local/state/vim/undo"
    append_powerlevel9k_local
    set_default_shell
    setup_tmux_plugins
}

install_gh_extensions() {
    if ! command -v gh &>/dev/null; then
        echo -e "\u001b[33;1m gh CLI not found, skipping extension installation. \u001b[0m"
        return 0
    fi

    echo -e "\u001b[7m Installing GitHub CLI extensions... \u001b[0m"
    for ext in "${gh_extensions[@]}"; do
        echo -e "\u001b[34;1m Installing gh extension: $ext... \u001b[0m"
        gh extension install "$ext" || true
    done
}

set_default_shell() {
    if [[ "$SHELL" != *"zsh"* ]] && command -v zsh &>/dev/null; then
        echo -e "\u001b[7m Setting zsh as default shell... \u001b[0m"
        chsh -s "$(which zsh)"
    fi
}

setup_tmux_plugins() {
    if ! command -v tmux &>/dev/null; then
        echo -e "\u001b[33;1m tmux not found, skipping tmux plugins setup. \u001b[0m"
        return 0
    fi

    local tpm_dir="$HOME/.config/tmux/plugins/tpm"
    echo -e "\u001b[7m Setting up Tmux Plugin Manager and plugins... \u001b[0m"

    if [[ ! -d "$tpm_dir" ]]; then
        echo -e "\u001b[34;1m Cloning TPM... \u001b[0m"
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
    fi

    if [[ -x "$tpm_dir/bin/install_plugins" ]]; then
        echo -e "\u001b[34;1m Installing tmux plugins... \u001b[0m"
        "$tpm_dir/bin/install_plugins" || true
    fi

    local tea_bin="$HOME/.config/tmux/plugins/tmux-tea/bin/tea.sh"
    if [[ -f "$tea_bin" ]]; then
        echo -e "\u001b[34;1m Symlinking tmux-tea to ~/.local/bin/tea... \u001b[0m"
        mkdir -p "$HOME/.local/bin"
        ln -sfnv "$tea_bin" "$HOME/.local/bin/tea"
    fi
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
    mkdir -p "$HOME/.config"
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
