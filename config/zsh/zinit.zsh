ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33}> Installing Zinit...%f"
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# Plugin configuration
MAGIC_ENTER_GIT_COMMAND="git status -s && git diff HEAD"
MAGIC_ENTER_OTHER_COMMAND="eza -Ah -s=extension --group-directories-first --icons"

# Theme - load immediately for instant prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Core plugins - immediate load after prompt
zinit ice lucid wait'0a' atinit'ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait'0a'
zinit light hlissner/zsh-autopair

zinit ice lucid wait'0a'
zinit light z-shell/F-Sy-H

# Completions
zinit ice lucid wait'0b' blockf
zinit light clarketm/zsh-completions

zinit ice lucid wait'0b'
zinit light Aloxaf/fzf-tab

# Oh-my-zsh utility plugins - deferred
zinit ice lucid wait'0c'
zinit snippet OMZ::plugins/dotenv/dotenv.plugin.zsh

zinit ice lucid wait'0c'
zinit snippet OMZ::plugins/globalias/globalias.plugin.zsh

zinit ice lucid wait'0c'
zinit snippet OMZ::plugins/magic-enter/magic-enter.plugin.zsh

