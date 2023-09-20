if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    navi widget fish | source
    cat $HOME/.config/shell/aliases.sh | source
end
