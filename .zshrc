# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export TERM="xterm-256color"

# Options
setopt hist_ignore_dups
setopt hist_expire_dups_first

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Magic Enter
MAGIC_ENTER_GIT_COMMAND="git status -s && git diff HEAD"
MAGIC_ENTER_OTHER_COMMAND="lsda"

# Plugins
plugins=(alias-tips
    dirhistory
    extract
    fancy-ctrl-z
    fasd
    fast-syntax-highlighting
    git
    globalias
    magic-enter
    ssh-agent
    tmux
    web-search
    z
    zsh-autosuggestions
    zsh-completions
    zsh-navigation-tools
    fzf) # fzf at last for '^R' binding

# Modules
autoload -U zmv
autoload -U compinit && compinit #Keep at last

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
    [ -f ~/.config/shell/powerlevel2k.zsh ] && source ~/.config/shell/powerlevel2k.zsh
fi

if [[ $TERM == "linux" ]]; then
    ZSH_THEME="ys"
fi

source $ZSH/oh-my-zsh.sh

# Key Bindings

# Reload config
bindkey -s '^H' ' source ~/.zshrc^M ^M'

# Move forward and backward in command
bindkey "^F" forward-word
bindkey "^B" backward-word

# Commands
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp-install zsh-wcomp-install zsh-ccomp zsh-wcomp)"

# Aliases
alias reload='source ~/.zshrc'

alias -s md=vim
alias -s html=vim

alias -g G="| grep "
alias -g wcc="| wc -m"
alias -g wcl="| wc -l"
alias -g wcw="| wc -w"

if [ -f "/usr/bin/grc" ]; then
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

# Causes Issues
# if [ -f "/usr/bin/kdeconnect-cli" ]; then
#     alias send="kdeconnect-cli -d "$(kdeconnect-cli -a --id-only)" --share"
# fi

# Local configurations
[ -f ~/.shrc.local ] && source ~/.shrc.local

# For fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
