# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# Options
setopt hist_ignore_dups
setopt hist_expire_dups_first

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Magic Enter
MAGIC_ENTER_GIT_COMMAND="git status -v && exag && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="lsda && echo -e '\n'"

# Plugins
plugins=(alias-tips
        dirhistory
        extract
        fancy-ctrl-z
        fzf
        fast-syntax-highlighting
        git
        globalias
        magic-enter
        tmux
        web-search
        z
        zsh-autosuggestions
        zsh-navigation-tools)


# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs virtualenv time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time_joined background_jobs ram_joined battery)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}╰%K{black}%F{blue}  %f%F{black}%k%f"

# Segment
DEFAULT_USER="$USER"
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf489 %n@$(hostname -f)"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD="30"
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_VI_COMMAND_MODE_STRING="\ue62b"
POWERLEVEL9K_VI_INSERT_MODE_STRING="\ue62b"
POWERLEVEL9K_TIME_FORMAT="%D{%a,%l:%M %P}"
POWERLEVEL9K_PYTHON_ICON="\ue235"
VIRTUAL_ENV_DISABLE_PROMPT=1
POWERLEVEL9K_SHOW_CHANGESET=false
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$"\uf036"
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$"\uf038"

#Colour
POWERLEVEL9K_COLOR_SCHEME="dark"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="yellow"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGED="green"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="green"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGING="orange1"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="orange1"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="black"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="cyan"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="red"
POWERLEVEL9K_BATTERY_LOW_COLOR="red"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="green"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="purple"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="purple"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="blue"
POWERLEVEL9K_DIR_ETC_BACKGROUND="red"
POWERLEVEL9K_DIR_HOME_BACKGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="blue"
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND="red"
POWERLEVEL9K_HISTORY_BACKGROUND="green"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="green"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="yellow"
POWERLEVEL9K_OS_ICON_FOREGROUND="darkcyan"
POWERLEVEL9K_RAM_BACKGROUND="yellow"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_STATUS_OK_BACKGROUND="green"
POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_TIME_BACKGROUND="darkcyan"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="blue"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="black"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="black"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="white"

source $ZSH/oh-my-zsh.sh

# Aliases
alias cat="bat"
alias ccp="clipcopy"
alias cp="cp -irv"
alias cpa="clippaste"
alias diff="diff --color=auto"
alias exag="exa -ahlT -L=1  -s=extension --git --group-directories-first"
alias fdir='find . -type d -name'
alias ffil='find . -type f -name'
alias grep="grep --color=auto"
alias jupn="jupyter notebook"
alias la="ls -AXb --group-directories-first --sort=extension"
alias ln="ln -sv"
alias lsda="lsd -A --group-dirs first --classify"
alias lsdo="lsd -A --group-dirs first --classify --recursive --depth=2"
alias mv="mv -iv"
alias ncdu="ncdu --color=dark -x"
alias open="xdg-open"
alias pacai="pacaur -S"
alias pacas="pacaur -Ss"
alias paci="sudo pacman -S"
alias pacq="pacman -Qi"
alias pacr="sudo pacman -R"
alias pacs="pacman -Ss"
alias pacu="sudo pacman -Syu"
alias pp="prettyping --nolegend"
alias q="exit"
alias rm="rm -irv"
alias sysd="sudo systemctl disable"
alias syse="sudo systemctl enable"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"
alias tmux="tmux -u"
alias tmuxm="tmux new-session \; split-window -h \; split-window -v \; attach"
alias trii="trizen -S --noedit"
alias tris="trizen -Ss --noedit"
alias triu="trizen -Syu --noedit"
alias vimrc="vim ~/.vimrc"
alias yayi="yay -S"
alias yayu="yay -Syu"
alias ytdl="youtube-dl"
alias zshrc="vim ~/.zshrc"

if hash grc 2>/dev/null; then
    alias df="grc df"
    alias gcc="grc gcc"
    alias iwconfig="grc iwconfig"
    alias last="grc last"
    alias make="grc make"
    alias mount="grc mount"
    alias mtr="grc mtr"
    alias ping="grc ping"
    alias ps="grc ps"
    alias traceroute="grc traceroute"
    alias wdiff="grc wdiff"
fi

if hash kdeconnect-cli 2>/dev/null; then
    alias send="kdeconnect-cli -d "$(kdeconnect-cli -a --id-only)" --share"
fi

# Commands
export EDITOR=vim 
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH

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

