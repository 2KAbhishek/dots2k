#!/bin/bash
# Environment variables
export EDITOR=nvim

# Fzf
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude=.git --exclude=node_modules'
export FZF_COMPLETION_TRIGGER=','
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--cycle
--prompt=' ' --pointer='>' --marker='✔'
--color='hl:148,hl+:154,prompt:blue,pointer:032,marker:010,bg+:000,gutter:000'
--margin=1
--border=rounded
--preview-window=right:65%
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --line-range=:500 {} || cat {})) || ([[ -d {} ]] && (exa -TFl --group-directories-first --icons --git -L 2 --no-user {} | less)) || echo {} 2> /dev/null | head -200'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | clipcopy)'
--bind 'ctrl-e:execute(nvim-qt {+})'
--bind 'ctrl-v:execute(code {+})'
"
export FZF_CTRL_T_COMMAND='fd -t f -HF -E=.git -E=node_modules'
export FZF_TMUX_OPTS='-p 90%'

export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export ZSH_TMUX_AUTOSTART='false'
export ZSH_TMUX_AUTOSTART_ONCE='false'
export ZSH_TMUX_AUTOCONNECT='false'
export DISABLE_AUTO_TITLE='true'

export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

export PATH=$HOME/Applications/bin:$PATH
export PATH=$GOBIN:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/.npm/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.luarocks/bin:$PATH
export PATH=$HOME/.config/composer/vendor:$PATH

export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

export NOTES_ROOT="$HOME/Projects/GitHub/Notes/Worklog/"

export GPG_TTY=$(tty)

# Executables
if type dircolors >/dev/null 2>&1; then eval "$(dircolors ~/.dircolors)"; fi
if type thefuck >/dev/null 2>&1; then eval "$(thefuck --alias)"; fi
if type navi >/dev/null 2>&1; then eval "$(navi widget zsh)"; fi

# broot file explorer
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br
# Do not map keys on WSL
if ! grep -qi microsoft /proc/version; then
    # Map CapsLock to Escape
    setxkbmap -option caps:swapescape
    # Enable touch to click for trackpad
    xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1
fi

# Homebrew
# [ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# [ -f "${HOMEBREW_PREFIX}/etc/bash_completion.d/brew" ] && source "${HOMEBREW_PREFIX}/etc/bash_completion.d/brew"

# asdf
[ -f /opt/asdf-vm/asdf.sh ] && source /opt/asdf-vm/asdf.sh
