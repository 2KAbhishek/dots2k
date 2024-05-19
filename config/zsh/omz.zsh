# Path to oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"

# Plugins
plugins=(alias-tips
    colorize
    dotenv
    dirhistory
    docker
    docker-compose
    extract
    F-Sy-H
    fancy-ctrl-z
    fasd
    fzf-tab
    gh
    git
    git-extra-commands
    globalias
    magic-enter
    mise
    timer
    tmux
    vi-mode
    web-search
    zoxide
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-navigation-tools
    fzf) # fzf at last for '^R' binding

# Uninstalled, TODO doesn't work with fzf-tab
# zsh-autocomplete

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $TERM == "linux" ]]; then
    ZSH_THEME="ys"
fi

source $ZSH/oh-my-zsh.sh
