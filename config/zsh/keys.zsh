autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -Uz copy-earlier-word
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N copy-earlier-word

copy-command () { $CLIPCOPY -n <<< $BUFFER }
zle -N copy-command

quote-word() {
  zle backward-word
  local start_pos=$CURSOR

  zle forward-word
  local end_pos=$CURSOR

  local word="${BUFFER[start_pos,end_pos]}"
  local quoted_word="\"$word\""

  BUFFER="${BUFFER[1,start_pos]}${quoted_word}${BUFFER[end_pos+1,-1]}"
  CURSOR=$((start_pos + ${#quoted_word}))
}
zle -N quote-word

bindkey "^[." insert-last-word
bindkey "^[m" copy-earlier-word
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey "^b" backward-word
bindkey "^f" fzf-file-widget
bindkey -s "^g" ' lazygit^M ^M'
bindkey "^k" autosuggest-accept
bindkey "^o" edit-command-line
bindkey "^q" quote-word
bindkey "^s" forward-word
bindkey -s "^t" ' tea^M ^M'
bindkey "^u" undo
bindkey "^x^e" edit-command-line
bindkey -s "^x^r" ' reload^M ^M'
bindkey "^x^v" vi-cmd-mode
bindkey "^x^x" exchange-point-and-mark
bindkey "^y" copy-command

