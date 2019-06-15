# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Magic Enter
MAGIC_ENTER_GIT_COMMAND="git status -v && exag && echo"
MAGIC_ENTER_OTHER_COMMAND="lsda && echo"

# Plugins
plugins=(alias-tips
        command-not-found
        dirhistory
        emoji
        extract
        fancy-ctrl-z
        fzf
        fast-syntax-highlighting
        git
        github
        globalias
        magic-enter
        tmux
        web-search
        z
        zsh-autosuggestions)


# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs docker_machine virtualenv time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history command_execution_time vi_mode background_jobs ram battery)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%K{black}%F{blue} \uf109 \uf156>%f%F{black}%k\ue0b0%f "

# Segment
DEFAULT_USER="abhishek"
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf489 %n@`hostname -f`"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD="30"
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_VI_COMMAND_MODE_STRING="\ue62b"
POWERLEVEL9K_VI_INSERT_MODE_STRING="\ue62b"
POWERLEVEL9K_TIME_FORMAT="%D{%a,%l:%M %p}"
POWERLEVEL9K_PYTHON_ICON="\ue235"
VIRTUAL_ENV_DISABLE_PROMPT=1
POWERLEVEL9K_SHOW_CHANGESET=true
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$"\uf036"
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$"\uf038"

#Colour
POWERLEVEL9K_COLOR_SCHEME="dark"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="033"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGED="046"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="046"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGING="208"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="208"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="black"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="049"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="red"
POWERLEVEL9K_BATTERY_LOW_COLOR="red"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="196"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="056"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="056"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="196"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="196"
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND="196"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND="black"
POWERLEVEL9K_DATE_BACKGROUND="242"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="027"
POWERLEVEL9K_DIR_ETC_BACKGROUND="196"
POWERLEVEL9K_DIR_HOME_BACKGROUND="027"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="027"
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND="196"
POWERLEVEL9K_HISTORY_BACKGROUND="040"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="076"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="214"
POWERLEVEL9K_OS_ICON_FOREGROUND="029"
POWERLEVEL9K_RAM_BACKGROUND="220"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="196"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_STATUS_OK_BACKGROUND="040"
POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_TIME_BACKGROUND="029"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="033"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="black"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="000"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="white"

source $ZSH/oh-my-zsh.sh

# Environment
EDITOR=vim 

# Aliases
alias la="ls -AXb --group-directories-first --sort=extension"
alias lsda="lsd -a --group-dirs first --classify"
alias exag="exa -ahlT -L=1  -s=extension --git --group-directories-first"
alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv"
alias ln="ln -sv"
alias q="exit"

alias cat="bat"

alias tmux="tmux -u"
alias tmuxm="tmux new-session \; split-window -h \; split-window -v \; attach"

alias df="grc df"
alias gcc="grc gcc"
alias iwconfig="grc iwconfig"
alias last="grc last"
alias mount="grc mount"
alias make="grc make"
alias mtr="grc mtr"
alias ping="grc ping"
alias ps="grc ps"
alias traceroute="grc traceroute"
alias wdiff="grc wdiff"
alias pp="prettyping --nolegend"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ncdu="ncdu --color=dark"

alias paci="sudo pacman -S"
alias pacr="sudo pacman -R"
alias pacu="sudo pacman -Syu"
alias pacs="pacman -Ss"
alias pacq="pacman -Qi"
alias pacai="pacaur -S"
alias pacas="pacaur -Ss"
alias trii="trizen -S --noedit"
alias tris="trizen -Ss --noedit"
alias triu="trizen -Syu --noedit"

alias syse="sudo systemctl enable"
alias sysd="sudo systemctl disable"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"

# Commands
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "

#Functions
function lc () {
    cd $1 &&
    la $2
}

mkcd ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

function tmux-clean() {
    tmux list-sessions | grep -E -v '\(attached\)$' | while IFS='\n' read line; do
    tmux kill-session -t "${line%%:*}"
    done
}

function man() {
     env \
         LESS_TERMCAP_mb=$(printf "\e[1;31m") \
         LESS_TERMCAP_md=$(printf "\e[1;36m") \
         LESS_TERMCAP_me=$(printf "\e[0m") \
         LESS_TERMCAP_se=$(printf "\e[0m") \
         LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
         LESS_TERMCAP_ue=$(printf "\e[0m") \
         LESS_TERMCAP_us=$(printf "\e[1;32m") \
         PAGER="${commands[less]:-$PAGER}" \
         _NROFF_U=1 \
         PATH="$HOME/bin:$PATH" \
             man "$@"
}

