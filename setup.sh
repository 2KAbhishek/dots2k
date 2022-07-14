#!/bin/bash

# Setup script for Dotfiles
function install_packages {
    echo -e "\u001b[7m Installing required packages... \u001b[0m"
    sudo pacman -S curl git zsh python vim neovim tmux bat fzf fasd fd \
        lsd github-cli git-delta lazygit openssh ranger the_silver_searcher \
        thefuck xclip broot ncdu ranger cmus htop broot xplr ripgrep
}

function install_oh_my_zsh {
    echo -e "\u001b[7m Installing oh-my-zsh...\u001b[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

function backup_configs {
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    mv -iv ~/.config/autorandr ~/.config/autorandr.old
    mv -iv ~/.config/bat/config ~/.config/bat/config.old
    mv -iv ~/.config/broot/conf.toml ~/.config/broot/conf.toml.old
    mv -iv ~/.config/cmus/darkwind.theme ~/.config/cmus/darkwind.theme.old
    mv -iv ~/.config/delta ~/.config/delta.old
    mv -iv ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.old
    mv -iv ~/.config/htop ~/.config/htop.old
    mv -iv ~/.config/i3 ~/.config/i3.old
    mv -iv ~/.config/i3status ~/.config/i3status.old
    mv -iv ~/.config/kitty ~/.config/kitty.old
    mv -iv ~/.config/libinput-gestures.conf ~/.config/libinput-gestures.conf.old
    mv -iv ~/.config/nvim ~/.config/nvim.old
    mv -iv ~/.config/ranger ~/.config/ranger.old
    mv -iv ~/.config/shell ~/.config/shell.old
    mv -iv ~/.config/sysinfo.conkyrc ~/.config/sysinfo.conkyrc.old
    mv -iv ~/.config/xplr ~/.config/xplr.old
    mv -iv ~/.asdfrc ~/.asdfrc.old
    mv -iv ~/.bashrc ~/.bashrc.old
    mv -iv ~/.dircolors ~/.dircolors.old
    mv -iv ~/.dmenurc ~/.dmenurc.old
    mv -iv ~/.gitconfig ~/.gitconfig.old
    mv -iv ~/.npmrc ~/.npmrc.old
    mv -iv ~/.p10k.zsh ~/.p10k.zsh.old
    mv -iv ~/.prettierrc ~/.prettierrc.old
    mv -iv ~/.pystartup ~/.pystartup.old
    mv -iv ~/.tmux.conf ~/.tmux.conf.old
    mv -iv ~/.vimrc ~/.vimrc.old
    mv -iv ~/.Xresources ~/.Xresources.old
    mv -iv ~/.zshrc ~/.zshrc.old
    echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

function setup_symlinks {
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    ln -sfnv "$PWD/.config/autorandr/" ~/.config/
    ln -sfnv "$PWD/.config/bat/" ~/.config/
    ln -sfnv "$PWD/.config/broot/" ~/.config/
    ln -sfnv "$PWD/.config/cmus/" ~/.config/
    ln -sfnv "$PWD/.config/delta/" ~/.config/
    ln -sfnv "$PWD/.config/fontconfig/fonts.conf" ~/.config/fontconfig/
    ln -sfnv "$PWD/.config/htop/" ~/.config/
    ln -sfnv "$PWD/.config/i3" ~/.config/
    ln -sfnv "$PWD/.config/i3status" ~/.config/
    ln -sfnv "$PWD/.config/kitty" ~/.config/
    ln -sfnv "$PWD/.config/libinput-gestures.conf" ~/.config/
    ln -sfnv "$PWD/.config/nvim" ~/.config/
    ln -sfnv "$PWD/.config/ranger/" ~/.config/
    ln -sfnv "$PWD/.config/shell" ~/.config/
    ln -sfnv "$PWD/.config/sysinfo.conkyrc" ~/.config/
    ln -sfnv "$PWD/.config/xplr/" ~/.config/
    cp -iuvr "$PWD/.local/share/konsole/" ~/.local/share/
    ln -sfnv "$PWD/.asdfrc" ~/
    ln -sfnv "$PWD/.bashrc" ~/
    ln -sfnv "$PWD/.dircolors" ~/
    ln -sfnv "$PWD/.dmenurc" ~/
    ln -sfnv "$PWD/.gitconfig" ~/
    ln -sfnv "$PWD/.npmrc" ~/
    ln -sfnv "$PWD/.p10k.zsh" ~/
    ln -sfnv "$PWD/.prettierrc" ~/
    ln -sfnv "$PWD/.pystartup" ~/
    ln -sfnv "$PWD/.tmux.conf" ~/
    ln -sfnv "$PWD/.vimrc" ~/
    ln -sfnv "$PWD/.Xresources" ~/
    ln -sfnv "$PWD/.zshrc" ~/
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
    git clone https://github.com/MichaelAquilina/zsh-auto-notify.git ~/.oh-my-zsh/custom/plugins/auto-notify
}

function install_vim_plugins {
    echo -e "\u001b[7m Installing plugin manager \u001b[0m"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    echo -e "\u001b[7m Installing plugins for vim and nvim... \u001b[0m"
    vim +PlugUpdate +qall
    nvim -c 'PlugUpdate | PlugClean | quitall'
}

function install_tmux_plugins {
    echo -e "\u001b[7m Installing tmux plugins... \u001b[0m"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux start-server
    tmux new-session -d
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server
}

function distro_tweaks {
    echo -e "\u001b[7m Distro specific tweaks... \u001b[0m"
    bash "$PWD"/scripts/local_distro.sh
}

function setup_dotfiles {
    echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
    install_packages
    install_oh_my_zsh
    backup_configs
    setup_symlinks
    install_zsh_plugins
    install_vim_plugins
    install_tmux_plugins
    distro_tweaks
    echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" -o "$1" = "-a" ]; then
    setup_dotfiles
    exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (0) Install packages \u001b[0m"
echo -e "  \u001b[34;1m (1) Install oh-my-zsh \u001b[0m"
echo -e "  \u001b[34;1m (2) Backup current config \u001b[0m"
echo -e "  \u001b[34;1m (3) Setup symlinks \u001b[0m"
echo -e "  \u001b[34;1m (4) Install zsh plugins \u001b[0m"
echo -e "  \u001b[34;1m (5) Install vim plugins \u001b[0m"
echo -e "  \u001b[34;1m (6) Install tmux plugins \u001b[0m"
echo -e "  \u001b[34;1m (7) Distro specific tweaks \u001b[0m"
echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"0")
    install_packages
    ;;

"1")
    install_oh_my_zsh
    ;;

"2")
    backup_configs
    ;;

"3")
    setup_symlinks
    ;;

"4")
    install_zsh_plugins
    ;;

"5")
    install_vim_plugins
    ;;

"6")
    install_tmux_plugins
    ;;

"7")
    distro_tweaks
    ;;

*)
    echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
    exit 0
    ;;
esac

exit 0
