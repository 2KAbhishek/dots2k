#!/bin/bash

# Core
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias 7zc="7z a -mx=9"
alias acp="advcp -gv"
alias amv="advmv -gv"
alias cat="bat"
alias cdx='cd $(xplr)'
alias cpa='"$CLIPPASTE"'
alias ccp='"$CLIPCOPY"'
alias cp="cp -irv"
alias diff="diff --color=auto"
alias ez="eza -Ah -s=extension --group-directories-first --icons"
alias ezl="eza -AhlT -L=1 -s=extension --group-directories-first --icons --git --git-ignore"
alias ezr="eza -AhlR -L=2 -s=extension --group-directories-first --icons --git --git-ignore"
alias ezt="eza -ahlT -L=2 -s=extension --group-directories-first --icons --git --git-ignore"
alias fd="fd -H"
alias fdir="find . -type d -name"
alias ffil="find . -type f -name"
alias grep="grep --color=auto"
alias la="ez"
alias ll="ezl"
alias lr="ezr"
alias lt="ezt"
alias ldir="ls -d */"
alias ln="ln -sfnv"
alias logout="sudo pkill -u \$USER"
alias ls='ls --color=auto'
alias lsa="lsd -A --group-dirs first --classify"
alias lso="lsd -A --group-dirs first --classify --recursive --depth=2"
alias lsl="lsd -A --group-dirs first --classify -l"
alias mv="mv -iv"
alias open="open_command"
alias rm="rm -irv"
alias rmf="rm -rf"
alias q="exit"

# Git
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --all -m"
alias gl="git pull --rebase --autostash"
alias gp="git push"
alias gss="git status -s"
alias gsd="git status -s && git diff HEAD"
alias gbrr="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias gcm='git checkout $(git_main_branch)'
alias gcma="git commit --amend -m"
alias gcman="git commit --amend --no-edit"
alias gcmn="git add . && git commit --amend --no-edit"
alias gdh="git diff HEAD"
alias gg="lazygit"
alias ghkey='gh ssh-key add ~/.ssh/id_ed25519.pub --title "$(hostname)" --type signing'
alias ghpr="gh pr create"
alias ghpd="pr_diff"
alias ghpf="pr_files"
alias ghrc="gh repo clone"
alias ghrd="gh repo edit -d"
alias ghrh="gh repo edit -h"
alias ghro="gh repo view --web"
alias ghrr="gh repo rename"
alias ghrs="gh release create"
alias ghrt="gh repo edit --add-topic "
alias ghrv="gh repo edit --accept-visibility-change-consequences --visibility "
alias gmv="git mv"
alias gmx="git merge -X ours"
alias greb="git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges main"
alias gsv="git status -v"
alias gtop='cd "$(git rev-parse --show-toplevel)"'

# Editor
alias e='nvim $(fzf)'
alias emd='emacs --daemon &'
alias emc="emacsclient -c -a 'emacs'"
alias emt='emacs --no-window-system'
alias vi="nvim"
alias vg="grep_open"
alias vc="changed_files"
alias vr="review_changes"
alias vb="binary_edit"
alias me='"$EDITOR" README.md'

# Configs
alias alac='"$EDITOR" ~/.config/alacritty/alacritty.toml'
alias alia='"$EDITOR" ~/.config/shell/aliases.sh'
alias bashc='"$EDITOR" ~/.bashrc'
alias enva='"$EDITOR" ~/.config/shell/environment.sh'
alias malia='"$EDITOR" ~/.config/mac/aliases.sh'
alias menva='"$EDITOR" ~/.config/mac/environment.sh'
alias func='"$EDITOR" ~/.config/shell/functions.sh'
alias gitc='"$EDITOR" ~/.gitconfig'
alias kitc='"$EDITOR" ~/.config/kitty/kitty.conf'
alias loca='"$EDITOR" ~/.config/shell/local.sh'
alias nvimc="nvim ~/.config/nvim/init.lua"
alias p2k='"$EDITOR" "$ZDOTDIR/prompt/init.zsh"'
alias qutc='"$EDITOR" ~/.config/qutebrowser/config.py'
alias tmuxc='"$EDITOR" ~/.config/tmux/tmux.conf'
alias vic="nvim ~/.config/nvim/init.lua"
alias vip="nvim ~/.config/nvim/lua/plugins/list.lua"
alias vimc="vim ~/.vimrc"
alias zshc='"$EDITOR" "$ZDOTDIR"/.zshrc'

# General
alias asc="asciinema"
alias cless="colorize_less -N"
alias cols="spectrum_ls"
alias exsu="exercism submit"
alias files="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias fix="fuck"
alias heic_to_jpg="magick mogrify -format jpg *.HEIC"
alias icat="kitty +kitten icat"
alias java8="export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre"
alias java11="export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/"
alias jupn="jupyter notebook"
alias kpa='keepassxc-cli clip "$KEEPASS_DB"'
alias mlc="npx markdown-link-check -pvq"
alias ncdu="ncdu --color=dark -x"
alias pick="pastel pick | pastel format hex | ccp"
alias png="pngquant --ext .png --force"
alias pp="prettyping --nolegend"
alias scr="scrot -s -l width=3,color='#1688f0',mode=edge,opacity=75 -F ~/Pictures/Screenshots/snap-%Y-%m-%d-%H-%M-%S.png -e 'xclip -selection clipboard -t image/png -i ~/Pictures/Screenshots/snap-%Y-%m-%d-%H-%M-%S.png'"
alias scrf="scrot -cd 3 -F ~/Pictures/Screenshots/snap-%Y-%m-%d-%H-%M-%S.png -e 'xclip -selection clipboard -t image/png -i ~/Pictures/Screenshots/snap-%Y-%m-%d-%H-%M-%S.png'"
alias scrw="scrot -ubcd 3 -F ~/Pictures/Screenshots/snap-%Y-%m-%d-%H-%M-%S.png -e 'xclip -selection clipboard -t image/png -i ~/Pictures/Screenshots/snap-%Y-%m-%d-%H-%M-%S.png'"
alias serv="npx live-server --port=1234 ."
alias sto="stackoverflow"
alias tmux="tmux -u"
alias tmuxm="tmux new-session \; split-window -h \; split-window -v \; attach"
alias wit="wiki-tui"
alias xp="xplr"
alias ytdl="youtube-dl"
alias play="playerctl play-pause"
alias next="playerctl next"
alias prev="playerctl previous"
alias song="playerctl metadata title"
alias syslog="sudo journalctl -b"
alias logshare="curl -F 'file=@-' 0x0.st"

# Languages
alias rsc="bundle exec rails console"
alias rsv="bundle exec rails server"
alias rsp="bundle exec rspec"
alias rcp="bundle exec rubocop -A"

# Package Manger
alias apti="sudo apt install"
alias apts="apt search"
alias aptr="sudo apt remove"
alias aptq="apt show"
alias aptu="sudo apt update && sudo apt upgrade"
alias dnfi="sudo dnf install"
alias dnfs="dnf search"
alias dnfr="sudo dnf remove"
alias dnfu="sudo dnf update"
alias npi="npm install"
alias npr="npm run"
alias paci="sudo pacman -S"
alias pacq="pacman -Qi"
alias pacr="sudo pacman -Rsc"
# alias pacrd="pacr $(pacman -Qdtq | tr '\n' ' ')"
alias pacs="pacman -Ss"
alias pacl="pacman -Q"
alias pacm="sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syu"
alias pacu="sudo pacman -Syu"
alias yayi="yay -S"
alias yayl="pacman -Qm"
alias yayu="yay -Syu"

# System
alias aran="autorandr -l"
alias blue="bluetuith"
alias litu="sudo light -A 10"
alias litd="sudo light -U 10"
alias plasmar="kquitapp5 plasmashell && kstart5 plasmashell"
alias shad="ssh-add ~/.ssh/id_rsa"
alias shag='eval "$(ssh-agent -s)"'
alias sysd="sudo systemctl disable"
alias syse="sudo systemctl enable"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"
alias topg="topgrade --no-retry -y"
alias topG="topgrade --no-retry -y --only git_repos"
alias vol="pulsemixer"
alias volu="amixer sset 'Master' 10%+"
alias vold="amixer sset 'Master' 10%-"
alias wifi="nmtui"
