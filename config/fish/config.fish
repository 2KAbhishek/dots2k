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

    if string match -q "darwin*" (uname -s)
        set -l mac_config_dir ~/.config/mac
        for file in aliases.sh environment.sh
            set -l filepath $mac_config_dir/$file
            if test -f $filepath
                source $filepath
            end
        end
    end
end
