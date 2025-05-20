# Completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
zle_highlight=('paste:none')

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Configure fzf previews for different commands
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -TFl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -TFl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -TFl --group-directories-first --icons --git -L 2 --no-user $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:vim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git show --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
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

compinit
