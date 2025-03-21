if status is-interactive
    if type -q fzf
        fzf --fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if type -q mise
        mise activate fish | source
    end

    if type -q navi
        navi widget fish | source
    end

    for file in aliases.sh local.sh
        set -l filepath $HOME/.config/shell/$file
        if test -f $filepath
            source $filepath
        end
    end
end
