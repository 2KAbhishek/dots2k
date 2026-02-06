# Completions configuration
autoload -Uz compinit

# Regenerate completion cache only once per day
_comp_files=($ZDOTDIR/.zcompdump(Nm-20))
if (( $#_comp_files )); then
    compinit -C -d "$ZDOTDIR/.zcompdump"
else
    compinit -d "$ZDOTDIR/.zcompdump"
fi
unset _comp_files

# Compile completion cache for faster loading
{
    if [[ -s "$ZDOTDIR/.zcompdump" && (! -s "$ZDOTDIR/.zcompdump.zwc" || "$ZDOTDIR/.zcompdump" -nt "$ZDOTDIR/.zcompdump.zwc") ]]; then
        zcompile "$ZDOTDIR/.zcompdump"
    fi
} &!

# case insensitive matchers
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# Completion styling
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
zle_highlight=('paste:none')

# Docker completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Configure fzf previews for different commands
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -Tl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -Tl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -Tl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath || eza -Tl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:vim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath || eza -Tl --group-directories-first --icons --git -L 2 --no-user $realpath'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git show --color=always $word'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word | delta ;;
esac'

zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
    "modified file") git diff $word | delta ;;
    "recent commit object name") git show --color=always $word | delta ;;
    *) git log --color=always $word ;;
esac'

if type mise >/dev/null 2>&1; then eval "$(mise activate zsh)"; fi
if type navi >/dev/null 2>&1; then eval "$(navi widget zsh)"; fi
if type fzf >/dev/null 2>&1; then eval "$(fzf --zsh)"; fi
if type zoxide >/dev/null 2>&1; then eval "$(zoxide init zsh)"; fi
