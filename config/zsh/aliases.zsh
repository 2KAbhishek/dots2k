# zsh Aliases
alias reload="source $ZDOTDIR/.zshrc"
which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'

# Suffix aliases
alias -s md=nvim
alias -s html=nvim

# Global aliases (Robust & Safe)
alias -g A1='| awk "{print \$1}"'
alias -g A2='| awk "{print \$2}"'
alias -g COL="| column -t"
alias -g C='| $CLIPCOPY'
alias -g DN=">/dev/null 2>&1"
alias -g F="| fzf"
alias -g FP="| fzf --preview 'bat --color=always --style=numbers --line-range :300 {}'"
alias -g G="| grep"
alias -g H="| head -30"
alias -g J="| jq -C"
alias -g JX="| fx"
alias -g L="| wc -l"
alias -g NE="2>/dev/null"
alias -g Q="&& exit"
alias -g US="| sort | uniq -c | sort -rn"
alias -g T="| tail -30"
alias -g X="| xargs"

alias -g fgs="| fzf --preview 'git show --color=always {1}'"
alias -g wcc="| wc -m"
alias -g wcw="| wc -w"
alias -g shareit='| curl -L -F "file=@-" https://0x0.st | $CLIPCOPY'

