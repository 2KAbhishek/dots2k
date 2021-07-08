#!/bin/bash

#Setup script for Dotfiles
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (1) Install oh-my-zsh \u001b[0m"
echo -e "  \u001b[34;1m (2) Install zsh plugins \u001b[0m"
echo -e "  \u001b[34;1m (3) Install vim plugins \u001b[0m"
echo -e "  \u001b[34;1m (4) Install tmux plugins \u001b[0m"
echo -e "  \u001b[34;1m (5) Setup symlinks \u001b[0m"
echo -e "  \u001b[34;1m (6) Distro specific tweaks \u001b[0m"
echo -e "  \u001b[31;1m (0) Exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"1")
    echo -e "\u001b[7m Installing oh-my-zsh...\u001b[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ;;

"2")
    echo -e "\u001b[7m Installing zsh plugins...\u001b[0m"
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
    git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
    ;;

"3")
    echo -e "\u001b[7m Installing Plug... \u001b[0m"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo -e "\u001b[7m Installing plugins for vim and nvim... \u001b[0m"
    vim +PlugUpdate +qall
    nvim -c 'PlugUpdate | PlugClean | quitall'
    ;;

"4")
    echo -e "\u001b[7m Installing tmux plugins... \u001b[0m"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux start-server
    tmux new-session -d
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server
    ;;

"5")
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    echo -e "\u001b[33;1m Backup existing files? (y/n) \u001b[0m"
    read -r backupOption
    if [[ $backupOption == "y" ]]; then
        echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
        mv -iv ~/.config/bat/config ~/.config/bat/config.old
        mv -iv ~/.config/broot/conf.toml ~/.config/broot/conf.toml.old
        mv -iv ~/.config/cmus/darkwind.theme ~/.config/cmus/darkwind.theme.old
        mv -iv ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.old
        mv -iv ~/.config/htop ~/.config/htop.old
        mv -iv ~/.config/i3 ~/.config/i3.old
        mv -iv ~/.config/i3status ~/.config/i3status.old
        mv -iv ~/.config/libinput-gestures.conf ~/.config/libinput-gestures.conf.old
        mv -iv ~/.config/nvim ~/.config/nvim.old
        mv -iv ~/.config/ranger ~/.config/ranger.old
        mv -iv ~/.config/shell ~/.config/shell.old
        mv -iv ~/.config/sysinfo.conkyrc ~/.config/sysinfo.conkyrc.old
        mv -iv ~/.bashrc ~/.bashrc.old
        mv -iv ~/.dircolors ~/.dircolors.old
        mv -iv ~/.dmenurc ~/.dmenurc.old
        mv -iv ~/.gitconfig ~/.gitconfig.old
        mv -iv ~/.npmrc ~/.npmrc.old
        mv -iv ~/.prettierrc ~/.prettierrc.old
        mv -iv ~/.pystartup ~/.pystartup.old
        mv -iv ~/.tmux.conf ~/.tmux.conf.old
        mv -iv ~/.vimrc ~/.vimrc.old
        mv -iv ~/.Xresources ~/.Xresources.old
        mv -iv ~/.zshrc ~/.zshrc.old
        echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
    else
        echo -e "\u001b[36;1m Skipping backups. \u001b[0m"
    fi

    echo -e "\u001b[36;1m Adding symlinks...\u001b[0m"
    cp -iuvr "$PWD/.local/share/konsole/" ~/.local/share/
    ln -sfnv "$PWD/.config/bat/" ~/.config/
    ln -sfnv "$PWD/.config/broot/" ~/.config/
    ln -sfnv "$PWD/.config/cmus/" ~/.config/
    ln -sfnv "$PWD/.config/fontconfig/" ~/.config/
    ln -sfnv "$PWD/.config/htop/" ~/.config/
    ln -sfnv "$PWD/.config/i3" ~/.config/
    ln -sfnv "$PWD/.config/i3status" ~/.config/
    ln -sfnv "$PWD/.config/libinput-gestures.conf" ~/.config/
    ln -sfnv "$PWD/.config/nvim" ~/.config/
    ln -sfnv "$PWD/.config/ranger/" ~/.config/
    ln -sfnv "$PWD/.config/shell" ~/.config/
    ln -sfnv "$PWD/.config/sysinfo.conkyrc" ~/.config/
    ln -sfnv "$PWD/.bashrc" ~/
    ln -sfnv "$PWD/.dircolors" ~/
    ln -sfnv "$PWD/.dmenurc" ~/
    ln -sfnv "$PWD/.gitconfig" ~/
    ln -sfnv "$PWD/.npmrc" ~/
    ln -sfnv "$PWD/.prettierrc" ~/
    ln -sfnv "$PWD/.pystartup" ~/
    ln -sfnv "$PWD/.tmux.conf" ~/
    ln -sfnv "$PWD/.vimrc" ~/
    ln -sfnv "$PWD/.Xresources" ~/
    ln -sfnv "$PWD/.zshrc" ~/
    ;;

"6")
    echo -e "\u001b[7m Distro specific tweaks... \u001b[0m"
    bash $PWD/scripts/local_distro.sh
    ;;

"0")
    echo -e "\u001b[32;1m Bye! \u001b[0m"
    exit 0
    ;;

*)
    echo -e "\u001b[31;1m Invalid option entered! \u001b[0m"
    exit 1
    ;;
esac

exit 0
