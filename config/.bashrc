#!/bin/bash
IS_MAC=false
[[ "$OSTYPE" == "darwin"* ]] && IS_MAC=true

export HISTFILE=~/.local/state/bash_history

source ~/.config/shell/prompt.sh

complete -cf sudo
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# bash completions
[ -r /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

source ~/.config/shell/environment.sh
$IS_MAC && [ -f ~/.config/mac/environment.sh ] && source ~/.config/mac/environment.sh
source ~/.config/shell/functions.sh
source ~/.config/shell/aliases.sh
$IS_MAC && [ -f ~/.config/mac/aliases.sh ] && source ~/.config/mac/aliases.sh

alias reload="source ~/.bashrc"

# Tool confs for bash
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/shell_init"
[[ -d "$cache_dir" ]] || mkdir -p "$cache_dir"

cache_bash_init() {
    local tool="$1" init_cmd="$2"
    if [[ ! -f "$cache_dir/${tool}.bash" ]] && type "$tool" >/dev/null 2>&1; then
        eval "$init_cmd" >"$cache_dir/${tool}.bash"
    fi
    [[ -f "$cache_dir/${tool}.bash" ]] && source "$cache_dir/${tool}.bash"
}

cache_bash_init "dircolors" "dircolors -b ~/.dircolors"
cache_bash_init "navi" "navi widget bash"
cache_bash_init "zoxide" "zoxide init bash"
cache_bash_init "fzf" "fzf --bash"
cache_bash_init "mise" "mise activate bash"

unset -f cache_bash_init

# Local configurations
[ -f ~/.config/shell/local.sh ] && source ~/.config/shell/local.sh
