if status is-interactive
    fzf --fish | source
    zoxide init fish | source
    navi widget fish | source
    mise activate fish | source
    cat $HOME/.config/shell/aliases.sh | source
end
