# Navigation
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

# Globbing
setopt extended_glob
setopt glob_dots
setopt nomatch

# History behavior
setopt append_history
setopt inc_append_history
setopt sharehistory
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt hist_reduce_blanks
setopt hist_verify

# Completion
setopt menu_complete
setopt complete_in_word
setopt always_to_end

# Interaction
setopt interactive_comments
setopt rm_star_wait
setopt no_flow_control

# Noise control
unsetopt beep

DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"

SAVEHIST=99999
HISTDUP=erase

