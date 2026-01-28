IS_MAC=false
[[ "$OSTYPE" == "darwin"* ]] && IS_MAC=true

# Load configs in specific order
source ~/.config/shell/environment.sh
$IS_MAC && [ -f ~/.config/mac/environment.sh ] && source ~/.config/mac/environment.sh
source "$ZDOTDIR/prompt/init.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/zinit.zsh"
source "$ZDOTDIR/completions.zsh"
source ~/.config/shell/functions.sh
source ~/.config/shell/aliases.sh
source "$ZDOTDIR/aliases.zsh"
$IS_MAC && [ -f ~/.config/mac/aliases.sh ] && source ~/.config/mac/aliases.sh
source "$ZDOTDIR/keys.zsh"

# Load Local configuration if exists
[ -f ~/.config/shell/local.sh ] && source ~/.config/shell/local.sh
