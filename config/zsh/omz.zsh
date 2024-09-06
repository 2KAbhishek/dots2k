# Path to oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

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
    fzf-tab
    gh
    git
    git-extra-commands
    globalias
    magic-enter
    timer
    tmux
    vi-mode
    web-search
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-navigation-tools)

# Uninstalled, TODO doesn't work with fzf-tab
# zsh-autocomplete

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $TERM == "linux" ]]; then
    ZSH_THEME="ys"
fi

source $ZSH/oh-my-zsh.sh
