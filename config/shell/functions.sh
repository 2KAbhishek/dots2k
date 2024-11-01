#!/bin/bash
# Functions

# copy authy token
auth() {
    mambembe-cli get-token -s "$@" | fzf --reverse -0 -1 | rg -oP 'Token: "\K\d+' | $CLIPCOPY
}

# cd into dir and list contents
lc() {
    cd "$1" && la "$2"
}

# Make directory and cd into it
mcd() {
    mkdir -p -- "$1" && cd -P -- "$1"
}

# kill all tmux sessions
tmux-clean() {
    tmux list-sessions | grep -E -v '\(attached\)$' | while IFS='\n' read line; do
        tmux kill-session -t "${line%%:*}"
    done
}

# Execute command in directory
xin() {
    (cd "${1}" && shift && ${@})
}

# show files which contain a term
grep_open() {
    local editor="$EDITOR"
    if [ "$EDITOR" = "vim" ] || [ "$EDITOR" = "nvim" ]; then
        local editor="$EDITOR +/$1 +'norm! n'"
    fi
    rg -l "$1" | fzf --bind "enter:execute($editor + {})"
}

# review changed files on this branch
review_changes() {
    local base_branch="${1:-}"

    if [ -z "$base_branch" ]; then
        base_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
        [ -z "$base_branch" ] && base_branch="main"
    fi

    git diff --name-only "$base_branch"...HEAD | fzf \
        --preview "git diff $base_branch...HEAD -- {} | delta --width \$FZF_PREVIEW_COLUMNS" \
        --bind "enter:execute($EDITOR {})"
}

# show staged and unstaged file changes
changed_files() {
    git status --short | awk '{print $2}' | fzf \
        --preview "git diff --cached -- {} | delta --width \$FZF_PREVIEW_COLUMNS && git diff -- {} | delta --width \$FZF_PREVIEW_COLUMNS" \
        --bind "enter:execute($EDITOR {})"
}

# Show diff for argument PR number for current repo
pr_diff() {
    gh pr diff "$1" | delta
}

# Show PR files for argument PR number for current repo
pr_files() {
    gh pr diff "$1" --name-only | fzf \
        --bind "enter:execute($EDITOR {})"
}

# edit a binary file in path, useful for editing executables/symlinked scripts
binary_edit() {
    local bin=""
    bin=$(which "$1")
    if [ -z "$bin" ]; then
        echo "Binary not found in path"
        return 1
    fi
    $EDITOR "$bin"
}

lvi() {
    NVIM_APPNAME=lvim2k nvim "$@"
}

# ex - archive extractor
ex() {
    if [ -f "$1" ]; then
        case $1 in
        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz) tar xzf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.rar) unrar x "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xf "$1" ;;
        *.tbz2) tar xjf "$1" ;;
        *.tgz) tar xzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Runs when tab is pressed after ,
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    cd) fzf "$@" --preview 'exa -TFl --group-directories-first --icons --git -L 2 --no-user {}' ;;
    nvim) fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' ;;
    vim) fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' ;;
    *) fzf "$@" ;;
    esac
}

# colorized man output
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;36m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        PAGER="${commands[less]:-$PAGER}" \
        _NROFF_U=1 \
        PATH="$HOME/bin:$PATH" \
        man "$@"
}

# show colored text
color_text() {
    for code in {000..255}; do
        printf "%s: \033[38;5;%smThis is how your text would look like\033[0m\n" "$code" "$code"
    done
}

# show colors and codes
color_escape() {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo
        echo
    done
}
