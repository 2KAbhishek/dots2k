# Load configs in specific order
source ~/.config/shell/environment.sh
source "$ZDOTDIR/prompt/init.zsh"
source "$ZDOTDIR/omz.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/completions.zsh"
source ~/.config/shell/functions.sh
source ~/.config/shell/aliases.sh
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/keys.zsh"

# Mac configs from mac2k
if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f ~/.config/mac/aliases.sh ] && source ~/.config/mac/aliases.sh
    [ -f ~/.config/mac/environment.sh ] && source ~/.config/mac/environment.sh
fi

# Load Local configuration if exists
[ -f ~/.config/shell/local.sh ] && source ~/.config/shell/local.sh
