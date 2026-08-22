# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

IS_MAC=false
[[ "$OSTYPE" == "darwin"* ]] && IS_MAC=true

# Load configs in specific order
source ~/.config/shell/environment.sh
$IS_MAC && [ -f ~/.config/mac/environment.sh ] && source ~/.config/mac/environment.sh
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/zinit.zsh"
source "$ZDOTDIR/completions.zsh"
source ~/.config/shell/aliases.sh
source "$ZDOTDIR/aliases.zsh"
$IS_MAC && [ -f ~/.config/mac/aliases.sh ] && source ~/.config/mac/aliases.sh
source ~/.config/shell/functions.sh
source "$ZDOTDIR/keys.zsh"

# Load Local configuration if exists
[ -f ~/.config/shell/local.sh ] && source ~/.config/shell/local.sh

# Asynchronously compile zsh configuration files for instant startup
{
    local f zdir="${ZDOTDIR:-$HOME/.config/zsh}"
    for f in "$zdir"/*.zsh(N) "$zdir"/prompt/*.zsh(N) "$zdir"/.zshrc(N) ~/.config/shell/*.sh(N) ~/.config/mac/*.sh(N) ~/.zshenv(N); do
        if [[ -s "$f" && (! -s "${f}.zwc" || "$f" -nt "${f}.zwc") ]]; then
            zcompile -R -- "$f" 2>/dev/null
        fi
    done
} &!

