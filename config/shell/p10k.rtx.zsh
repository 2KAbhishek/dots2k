# Powerlevel10k prompt segments for rtx
#
# https://github.com/romkatv/powerlevel10k
# https://github.com/jdxcode/rtx
# [Feature request: add segment for rtx](https://github.com/romkatv/powerlevel10k/issues/2212)
#
# Usage in ~/.zshrc:
#
#   # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#   if type rtx >/dev/null 2>&1; then source ~/.config/shell/rtx.zsh; fi
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

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/rtx}")
}

