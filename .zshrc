# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Plugin options
MAGIC_ENTER_GIT_COMMAND="git status -s && git diff HEAD"
MAGIC_ENTER_OTHER_COMMAND="lsda"
ZSH_PYENV_QUIET=true
ZSH_COLORIZE_TOOL="chroma"
ZSH_COLORIZE_STYLE="dracula"
ZSH_COLORIZE_CHROMA_FORMATTER="terminal16m"
TIMER_THRESHOLD=1

# Plugins
plugins=(adb
    alias-tips
    catimg
    colorize
    direnv
    dirhistory
    docker
    docker-compose
    extract
    fancy-ctrl-z
    fasd
    fast-syntax-highlighting
    fzf-tab
    gh
    git
    git-extra-commands
    globalias
    magic-enter
    nvm
    pyenv
    rvm
    thefuck
    timer
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

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# For fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Common environment variables
[ -f ~/.config/shell/envars.sh ] && source ~/.config/shell/envars.sh

# Common functions
[ -f ~/.config/shell/functions.sh ] && source ~/.config/shell/functions.sh

# Common aliases
[ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh

# powerlevel2k
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
    [ -f ~/.config/shell/powerlevel2k.zsh ] && source ~/.config/shell/powerlevel2k.zsh
fi

# zsh only configs
eval "$(dircolors ~/.dircolors)";
eval "$(pyenv virtualenv-init -)"

function color_picker() {
    for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
}

# Local configurations
[ -f ~/.shrc.local ] && source ~/.shrc.local

