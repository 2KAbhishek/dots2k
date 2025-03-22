if status is-interactive
    function source_if_exists
        if test -f $argv[1]
            source $argv[1]
        end
    end

    function init_tool
        if type -q $argv[1]
            eval "$argv[2]"
        end
    end

    # Initialize tools with Fish integration
    init_tool fzf "fzf --fish | source"
    init_tool zoxide "zoxide init fish | source"
    init_tool mise "mise activate fish | source"
    init_tool navi "navi widget fish | source"

    # Source shell config files
    for file in aliases.sh local.sh
        source_if_exists $HOME/.config/shell/$file
    end

    # Mac-specific configuration
    if string match -q "darwin*" (uname -s)
        set -l mac_config_dir ~/.config/mac
        for file in environment.sh aliases.sh
            source_if_exists $mac_config_dir/$file
        end
    end
end

