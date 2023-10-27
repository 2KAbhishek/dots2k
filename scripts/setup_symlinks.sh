#!/bin/bash
# config directory
ln -sfnv "$PWD/config/autorandr/" ~/.config/
ln -sfnv "$PWD/config/awesome/" ~/.config/
ln -sfnv "$PWD/config/bat/" ~/.config/
ln -sfnv "$PWD/config/broot/" ~/.config/
ln -sfnv "$PWD/config/bundle/" ~/.bundle
ln -sfnv "$PWD/config/cmus/" ~/.config/
ln -sfnv "$PWD/config/delta/" ~/.config/
ln -sfnv "$PWD/config/fish/" ~/.config/
ln -sfnv "$PWD/config/fontconfig/" ~/.config/
ln -sfnv "$PWD/config/gitignore.global" ~/.config/
ln -sfnv "$PWD/config/htop/" ~/.config/
ln -sfnv "$PWD/config/i3" ~/.config/
ln -sfnv "$PWD/config/i3status" ~/.config/
ln -sfnv "$PWD/config/kitty" ~/.config/
ln -sfnv "$PWD/config/lazygit" ~/.config/
ln -sfnv "$PWD/config/libinput-gestures.conf" ~/.config/
ln -sfnv "$PWD/config/nvim" ~/.config/
ln -sfnv "$PWD/config/qutebrowser/" ~/.config/
ln -sfnv "$PWD/config/ranger/" ~/.config/
ln -sfnv "$PWD/config/shell" ~/.config/
ln -sfnv "$PWD/config/sysinfo.conkyrc" ~/.config/
ln -sfnv "$PWD/config/topgrade.toml" ~/.config/
ln -sfnv "$PWD/config/xplr/" ~/.config/

# home directory
ln -sfnv "$PWD/config/.asdfrc" ~/
ln -sfnv "$PWD/config/.bashrc" ~/
ln -sfnv "$PWD/config/.dircolors" ~/
ln -sfnv "$PWD/config/.dmenurc" ~/
ln -sfnv "$PWD/config/.gitconfig" ~/
ln -sfnv "$PWD/config/.inputrc" ~/
ln -sfnv "$PWD/config/.luarc.json" ~/
ln -sfnv "$PWD/config/.prettierrc" ~/
ln -sfnv "$PWD/config/.pryrc" ~/
ln -sfnv "$PWD/config/.pystartup" ~/
ln -sfnv "$PWD/config/.stylua.toml" ~/
ln -sfnv "$PWD/config/.tmux.conf" ~/
ln -sfnv "$PWD/config/.vimrc" ~/
ln -sfnv "$PWD/config/.Xresources" ~/
ln -sfnv "$PWD/config/.zshrc" ~/

# local directory
cp -ivr "$PWD/config/konsole/" ~/.local/share/

