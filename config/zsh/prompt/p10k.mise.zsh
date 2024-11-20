# Powerlevel10k prompt segments for mise
# [Feature request: add segment for mise](https://github.com/romkatv/powerlevel10k/issues/2212)
# Usage in ~/.zshrc:
#   [[ -f ~/.config/shell/p10k.mise.zsh ]] && source ~/.config/shell/p10k.mise.zsh

() {
  function prompt_mise() {
    local plugins=("${(@f)$(mise ls --current 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" {print $1, $2}')}")
    local plugin
    for plugin in ${(k)plugins}; do
      local parts=("${(@s/ /)plugin}")
      local tool=${(U)parts[1]}
      local version=${parts[2]}
      p10k segment -r -i "${tool}_ICON" -s $tool -t "$version"
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

