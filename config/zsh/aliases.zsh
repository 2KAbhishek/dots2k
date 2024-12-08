# zsh Aliases
alias reload="source $ZDOTDIR/.zshrc"
which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'

# Suffix aliases
alias -s md=nvim
alias -s html=nvim

# Global aliases
alias -g C="| $CLIPCOPY"
alias -g F="| fpp -ko -nfc"
alias -g G="| grep"
alias -g L="| wc -l"
alias -g Q="&& exit"
alias -g Y="| curl -F 'file=@-' 0x0.st"
alias -g Z="| fzf"
alias -g wcc="| wc -m"
alias -g wcw="| wc -w"

