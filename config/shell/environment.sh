#!/bin/bash
# Environment variables

# Display server & OS detection for clipboard and terminal
if [ -n "$WAYLAND_DISPLAY" ]; then
    # Wayland (Sway, Hyprland, etc.)
    export TERMINAL="${TERMINAL:-footclient}"
    export CLIPCOPY="wl-copy"
    export CLIPPASTE="wl-paste"
elif [[ "${OSTYPE:-}" == darwin* ]]; then
    # macOS
    export TERMINAL="${TERMINAL:-kitty}"
    export CLIPCOPY="pbcopy"
    export CLIPPASTE="pbpaste"
elif [ -n "$WSL_DISTRO_NAME" ] || [ -n "$WSL_INTEROP" ]; then
    # Windows / WSL (Windows Terminal + win32yank)
    export TERMINAL="${TERMINAL:-wt.exe}"
    export CLIPCOPY="win32yank.exe -i --crlf"
    export CLIPPASTE="win32yank.exe -o --lf"
elif [ -n "$TERMUX_VERSION" ]; then
    # Android (Termux)
    export CLIPCOPY="termux-clipboard-set"
    export CLIPPASTE="termux-clipboard-get"
else
    # Linux X11 (i3, bspwm, dwm, etc.)
    export TERMINAL="${TERMINAL:-kitty}"
    export CLIPCOPY="xclip -selection clipboard"
    export CLIPPASTE="xclip -selection clipboard -o"
fi

export EDITOR=nvim
# export BROWSER=qutebrowser

# Fzf
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude=.git --exclude=node_modules'
export FZF_COMPLETION_TRIGGER=','
export FZF_DEFAULT_OPTS="
--layout=reverse --info=inline --height=80% --multi --cycle --margin=1 --border=rounded
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --line-range=:500 {} || cat {})) || ([[ -d {} ]] \
&& (eza -ahlT -L=2 -s=extension --group-directories-first --icons --git --git-ignore --no-user {} | less)) || echo {} 2> /dev/null | head -200'
--prompt=' ' --pointer=' ' --marker=' '
--color='hl:148,hl+:154,prompt:blue,pointer:032,marker:010,bg+:000,gutter:000'
--preview-window=right:65%
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | eval "$CLIPCOPY")'
--bind 'ctrl-e:execute($TERMINAL $EDITOR {+})+reload(fzf)'"

export FZF_CTRL_T_COMMAND='fd -t f -HF -E=.git -E=node_modules'
export FZF_TMUX_OPTS='-p 90%'

# Go environment
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"

# Fast PATH export
export PATH="$HOME/.local/bin:$GOBIN:$HOME/.cargo/bin:$HOME/.npm/bin:$HOME/.luarocks/bin:$HOME/.bun/bin:$PATH"

export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"
