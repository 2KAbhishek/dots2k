# Options
setopt append_history
setopt auto_cd
setopt extended_glob
setopt glob_dots
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt interactive_comments
setopt menu_complete
setopt nomatch
setopt sharehistory
unsetopt beep

# Environment Vars
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
SAVEHIST=99999

# Plugin options
MAGIC_ENTER_GIT_COMMAND="gsd"
MAGIC_ENTER_OTHER_COMMAND="la"
ZSH_PYENV_QUIET=true
ZSH_COLORIZE_TOOL="chroma"
ZSH_COLORIZE_STYLE="dracula"
ZSH_COLORIZE_CHROMA_FORMATTER="terminal16m"
TIMER_THRESHOLD=1
AUTO_NOTIFY_IGNORE+=("docker" "make")

# Rename module
autoload -U zmv
