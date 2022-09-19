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
COMPLETION_WAITING_DOTS="false"
SAVEHIST=99999

# Plugins
plugins=(adb
    alias-tips
    asdf
    auto-notify
    catimg
    colorize
    direnv
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
    thefuck
    timer
    tmux
    web-search
    z
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-navigation-tools
    fzf) # fzf at last for '^R' binding

# Uninstalled
# zsh-autocomplete

# Modules
autoload -U zmv
autoload -U compinit && compinit #Keep at last

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Plugin options
MAGIC_ENTER_GIT_COMMAND="git status -s && git diff HEAD"
MAGIC_ENTER_OTHER_COMMAND="lsda"
ZSH_PYENV_QUIET=true
ZSH_COLORIZE_TOOL="chroma"
ZSH_COLORIZE_STYLE="dracula"
ZSH_COLORIZE_CHROMA_FORMATTER="terminal16m"
TIMER_THRESHOLD=1

# fzf-tab previews
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -TFl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:vim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git show --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word | delta ;;
    esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
    "modified file") git diff $word | delta ;;
    "recent commit object name") git show --color=always $word | delta ;;
    *) git log --color=always $word ;;
    esac'

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $TERM == "linux" ]]; then
    ZSH_THEME="ys"
fi

source $ZSH/oh-my-zsh.sh

# powerlevel2k
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]]; then
    [ -f ~/.config/shell/powerlevel2k.zsh ] && source ~/.config/shell/powerlevel2k.zsh
fi

# Key Bindings
bindkey -s '^H' ' source ~/.zshrc^M ^M'

bindkey "^F" fzf-file-widget

# Aliases
alias reload='source ~/.zshrc'

alias -s md=nvim
alias -s html=nvim

alias -g G="| grep "
alias -g wcc="| wc -m"
alias -g wcl="| wc -l"
alias -g wcw="| wc -w"
alias -g Z="| fzf"

# Commands
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp-install zsh-wcomp-install zsh-ccomp zsh-wcomp)"

# zsh functions
function color_picker() {
    for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
}

# For fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Common environment variables
[ -f ~/.config/shell/envars.sh ] && source ~/.config/shell/envars.sh

# Common functions
[ -f ~/.config/shell/functions.sh ] && source ~/.config/shell/functions.sh

# Common aliases
[ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh

# Local configurations
[ -f ~/.local.sh ] && source ~/.local.sh

