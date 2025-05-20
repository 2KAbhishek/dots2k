# Path to oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

# Plugins
plugins=(
    alias-tips
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
    zsh-navigation-tools
)

# Uninstalled, TODO doesn't work with fzf-tab
# zsh-autocomplete

# Plugin options
MAGIC_ENTER_GIT_COMMAND="gsd"
MAGIC_ENTER_OTHER_COMMAND="la"
ZSH_PYENV_QUIET=true
ZSH_COLORIZE_TOOL="chroma"
ZSH_COLORIZE_STYLE="dracula"
ZSH_COLORIZE_CHROMA_FORMATTER="terminal16m"
TIMER_THRESHOLD=1
AUTO_NOTIFY_IGNORE+=("docker" "make")

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $TERM == "linux" ]]; then
    ZSH_THEME="ys"
fi

source $ZSH/oh-my-zsh.sh
