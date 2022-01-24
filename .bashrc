# Title
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'

use_color=true

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    eval $(dircolors -b ~/.dir_colors)

    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
    fi
    alias ls='ls --color=auto'
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'

else
    if [[ ${EUID} == 0 ]] ; then
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi


unset use_color

complete -cf sudo
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

alias reload="source ~/.bashrc"

# zsh completions
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# fzf keybindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Common environment variables
[ -f ~/.config/shell/envars.sh ] && source ~/.config/shell/envars.sh

# Common functions
[ -f ~/.config/shell/functions.sh ] && source ~/.config/shell/functions.sh

# Common aliases
[ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh

# Local configurations
[ -f ~/.local.sh ] && source ~/.local.sh
