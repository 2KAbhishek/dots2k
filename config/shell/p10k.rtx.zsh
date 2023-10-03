# Powerlevel10k prompt segments for rtx
#
# https://github.com/romkatv/powerlevel10k
# https://github.com/jdxcode/rtx
# [Feature request: add segment for rtx](https://github.com/romkatv/powerlevel10k/issues/2212)
#
# Usage in ~/.zshrc:
#
#   # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#   [[ -f ~/.config/shell/p10k.zsh ]] && source ~/.config/shell/p10k.zsh
#   [[ -f ~/.config/shell/p10k.rtx.zsh ]] && source ~/.config/shell/p10k.rtx.zsh
#

() {
  function prompt_rtx() {
    local plugins=("${(@f)$(rtx ls --current 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/rtx/config.toml" {print $1, $2}')}")
    local plugin
    for plugin in ${(k)plugins}; do
      local parts=("${(@s/ /)plugin}")
      local tool=${(U)parts[1]}
      local version=${parts[2]}
      p10k segment -r -i "${tool}_ICON" -s $tool -t "$version"
    done
  }

  # Colors
  typeset -g POWERLEVEL9K_RTX_BACKGROUND=66

  typeset -g POWERLEVEL9K_RTX_DOTNET_CORE_BACKGROUND=134
  typeset -g POWERLEVEL9K_RTX_ELIXIR_BACKGROUND=129
  typeset -g POWERLEVEL9K_RTX_ERLANG_BACKGROUND=125
  typeset -g POWERLEVEL9K_RTX_FLUTTER_BACKGROUND=38
  typeset -g POWERLEVEL9K_RTX_GOLANG_BACKGROUND=37
  typeset -g POWERLEVEL9K_RTX_HASKELL_BACKGROUND=172
  typeset -g POWERLEVEL9K_RTX_JAVA_BACKGROUND=32
  typeset -g POWERLEVEL9K_RTX_JULIA_BACKGROUND=70
  typeset -g POWERLEVEL9K_RTX_LUA_BACKGROUND=32
  typeset -g POWERLEVEL9K_RTX_NODEJS_BACKGROUND=28
  typeset -g POWERLEVEL9K_RTX_PERL_BACKGROUND=67
  typeset -g POWERLEVEL9K_RTX_PHP_BACKGROUND=99
  typeset -g POWERLEVEL9K_RTX_POSTGRES_BACKGROUND=31
  typeset -g POWERLEVEL9K_RTX_PYTHON_BACKGROUND=37
  typeset -g POWERLEVEL9K_RTX_RUBY_BACKGROUND=196
  typeset -g POWERLEVEL9K_RTX_RUST_BACKGROUND=37

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/rtx}")
}

