# Powerlevel10k prompt segments for mise
# [Feature request: add segment for mise](https://github.com/romkatv/powerlevel10k/issues/2212)
# Usage in ~/.zshrc:
#   [[ -f ~/.config/shell/p10k.mise.zsh ]] && source ~/.config/shell/p10k.mise.zsh

() {
    # Cache global configurations at shell startup with pure Zsh (zero subprocess forks)
    typeset -gA POWERLEVEL9K_MISE_GLOBAL_VERSIONS
    local cfg line tool ver in_tools target real_path mise_installs="${XDG_DATA_HOME:-$HOME/.local/share}/mise/installs"

    # 1. Parse global TOML configs (~/.config/mise/config.toml & ~/.mise.toml)
    for cfg in "${XDG_CONFIG_HOME:-$HOME/.config}/mise/config.toml" "$HOME/.mise.toml"; do
        if [[ -r "$cfg" ]]; then
            in_tools=0
            while IFS= read -r line || [[ -n "$line" ]]; do
                line="${line%%\#*}"
                line="${line##[[:space:]]*}"
                [[ -z "$line" ]] && continue
                if [[ "$line" =~ '^\[tools\]' ]]; then
                    in_tools=1
                    continue
                elif [[ "$line" =~ '^\[' ]]; then
                    in_tools=0
                    continue
                fi
                if (( in_tools )) && [[ "$line" =~ '^([a-zA-Z0-9_-]+)[[:space:]]*=[[:space:]]*["'\'']?([^"'\'']+)["'\'']?' ]]; then
                    tool="${match[1]}"
                    ver="${match[2]}"
                    # Resolve aliases & symlinks (e.g. "latest" -> "5.1.0")
                    local target="$mise_installs/$tool/$ver"
                    if [[ -e "$target" ]]; then
                        local real_path="${target:A}"
                        ver="${real_path:t}"
                    fi
                    POWERLEVEL9K_MISE_GLOBAL_VERSIONS[$tool]="$ver"
                fi
            done < "$cfg"
        fi
    done

    # 2. Parse legacy ~/.tool-versions if present
    if [[ -r "$HOME/.tool-versions" ]]; then
        while IFS= read -r line || [[ -n "$line" ]]; do
            line="${line%%\#*}"
            line="${line##[[:space:]]*}"
            [[ -z "$line" ]] && continue
            if [[ "$line" =~ '^([a-zA-Z0-9_-]+)[[:space:]]+([^[:space:]]+)' ]]; then
                tool="${match[1]}"
                ver="${match[2]}"
                local target="$mise_installs/$tool/$ver"
                if [[ -e "$target" ]]; then
                    local real_path="${target:A}"
                    ver="${real_path:t}"
                fi
                POWERLEVEL9K_MISE_GLOBAL_VERSIONS[$tool]="$ver"
            fi
        done < "$HOME/.tool-versions"
    fi

    # User configurations (can be overridden in ~/.zshrc or prompt config)
    [[ -z "${POWERLEVEL9K_MISE_MAX_SEGMENTS}" ]] && typeset -g POWERLEVEL9K_MISE_MAX_SEGMENTS=2
    [[ -z "${POWERLEVEL9K_MISE_HIDE_GLOBAL}" ]] && typeset -g POWERLEVEL9K_MISE_HIDE_GLOBAL=true

    function prompt_mise() {
        local dir tool version
        local -A seen
        local -i count=0
        local -i max_segments=$POWERLEVEL9K_MISE_MAX_SEGMENTS

        for dir in $path; do
            if [[ "$dir" == *mise/installs/* ]]; then
                local resolved_dir="${dir:A}"
                if [[ "$resolved_dir" =~ "mise/installs/([^/]+)/([^/]+)(/bin)?$" ]]; then
                    tool="${(U)match[1]}"
                    version="${match[2]}"
                    [[ "$tool" == "USAGE" ]] && continue
                    [[ -n "${seen[$tool]}" ]] && continue

                    # Hide if version matches global configuration
                    if [[ "$POWERLEVEL9K_MISE_HIDE_GLOBAL" == "true" ]]; then
                        local lower_tool="${(L)tool}"
                        if [[ "${POWERLEVEL9K_MISE_GLOBAL_VERSIONS[$lower_tool]}" == "$version" ]]; then
                            continue
                        fi
                    fi

                    # Check max segments limit
                    if (( max_segments > 0 && count >= max_segments )); then
                        break
                    fi

                    p10k segment -r -i "${tool}_ICON" -s "$tool" -t "$version"
                    seen[$tool]=1
                    (( count++ ))
                fi
            fi
        done
    }

    # Colors
    typeset -g POWERLEVEL9K_MISE_BACKGROUND=1

    typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_BACKGROUND=93
    typeset -g POWERLEVEL9K_MISE_ELIXIR_BACKGROUND=129
    typeset -g POWERLEVEL9K_MISE_ERLANG_BACKGROUND=160
    typeset -g POWERLEVEL9K_MISE_FLUTTER_BACKGROUND=33
    typeset -g POWERLEVEL9K_MISE_GO_BACKGROUND=81
    typeset -g POWERLEVEL9K_MISE_HASKELL_BACKGROUND=99
    typeset -g POWERLEVEL9K_MISE_JAVA_BACKGROUND=196
    typeset -g POWERLEVEL9K_MISE_JULIA_BACKGROUND=34
    typeset -g POWERLEVEL9K_MISE_LUA_BACKGROUND=33
    typeset -g POWERLEVEL9K_MISE_NODE_BACKGROUND=34
    typeset -g POWERLEVEL9K_MISE_PERL_BACKGROUND=33
    typeset -g POWERLEVEL9K_MISE_PHP_BACKGROUND=93
    typeset -g POWERLEVEL9K_MISE_POSTGRES_BACKGROUND=33
    typeset -g POWERLEVEL9K_MISE_PYTHON_BACKGROUND=33
    typeset -g POWERLEVEL9K_MISE_RUBY_BACKGROUND=196
    typeset -g POWERLEVEL9K_MISE_RUST_BACKGROUND=208

    # Substitute the default asdf prompt element
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/mise}")
}

