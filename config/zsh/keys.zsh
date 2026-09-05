autoload -Uz copy-earlier-word
autoload -Uz edit-command-line
zle -N copy-earlier-word
zle -N edit-command-line
zle -N fancy-ctrl-z

copy-command () { eval "$CLIPCOPY" <<< $BUFFER }
zle -N copy-command

quote-word() {
  zle backward-word
  local start_pos=$CURSOR

  zle forward-word
  local end_pos=$CURSOR

  local word="${BUFFER[start_pos,end_pos]}"
  local quoted_word="\"$word\""

  BUFFER="${BUFFER[1,start_pos]}${quoted_word}${BUFFER[end_pos+1,#BUFFER]}"
  (( CURSOR = start_pos + #quoted_word ))
}
zle -N quote-word

# Helper to run an interactive application cleanly in the foreground
_run_foreground_widget() {
  local cmd="$1"
  zle -I
  eval "$cmd"
  zle redisplay
}

open-dexe() { _run_foreground_widget "dexe" }
zle -N open-dexe

open-lazygit() { _run_foreground_widget "lazygit" }
zle -N open-lazygit

open-tdo() { _run_foreground_widget "tdo -f" }
zle -N open-tdo

open-tea() {
  zle push-line
  BUFFER="tea"
  zle accept-line
}
zle -N open-tea

reload-shell() { _run_foreground_widget "source \$ZDOTDIR/.zshrc" }
zle -N reload-shell

bindkey "^[." insert-last-word
bindkey "^[b" backward-word
bindkey "^[d" open-dexe
bindkey "^[e" fzf-file-widget
bindkey "^[f" forward-word
bindkey "^[g" open-lazygit
bindkey "^[m" copy-earlier-word
bindkey "^[n" open-tdo
bindkey "^[r" reload-shell
bindkey "^[t" open-tea
bindkey "^a" beginning-of-line
bindkey "^b" backward-word
bindkey "^e" end-of-line
bindkey "^f" fzf-file-widget
bindkey "^o" edit-command-line
bindkey "^q" quote-word
bindkey "^s" forward-word
bindkey "^u" undo
bindkey "^x^e" edit-command-line
bindkey "^x^v" vi-cmd-mode
bindkey "^x^x" exchange-point-and-mark
bindkey "^y" copy-command
bindkey '^Z' fancy-ctrl-z
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
