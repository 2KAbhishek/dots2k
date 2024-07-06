# Shell Keybindings

## Navigation 🚀

| Keybinding                       | Action                                                       |
| -------------------------------- | ------------------------------------------------------------ |
| <kbd>Alt</kbd> + <kbd>f/b</kbd>  | Move cursor to previous/next word                            |
| <kbd>Ctrl</kbd> + <kbd>a/e</kbd> | Move cursor to beginning/end of command                      |
| <kbd>Ctrl</kbd> + <kbd>xx</kbd>  | Toggle between the start of line and current cursor position |

## Editing ✏️

| Keybinding                            | Action                                              |
| ------------------------------------- | --------------------------------------------------- |
| <kbd>Alt</kbd> + <kbd>.</kbd> or `!$` | Previous commands last argument                     |
| <kbd>Alt</kbd> + <kbd>c</kbd>         | Capitalize word                                     |
| <kbd>Alt</kbd> + <kbd>d</kbd>         | Delete next word                                    |
| <kbd>Alt</kbd> + <kbd>Del</kbd>       | Delete previous word                                |
| <kbd>Alt</kbd> + <kbd>l/u</kbd>       | Lowercase/Uppercase word                            |
| <kbd>Alt</kbd> + <kbd>r</kbd>         | Cancel the changes, revert                          |
| <kbd>Alt</kbd> + <kbd>t</kbd>         | Swap current word with previous                     |
| <kbd>Alt</kbd> + <kbd>w</kbd>         | Delete until beginning (zsh)                        |
| <kbd>Ctrl</kbd> + <kbd>\_</kbd>       | Undo                                                |
| <kbd>Ctrl</kbd> + <kbd>k</kbd>        | Cut till end                                        |
| <kbd>Ctrl</kbd> + <kbd>t</kbd>        | Swap the last two characters before the cursor      |
| <kbd>Ctrl</kbd> + <kbd>u</kbd>        | Delete whole line (zsh)/ cut until beginning (bash) |
| <kbd>Ctrl</kbd> + <kbd>w</kbd>        | Cut previous word                                   |
| <kbd>Ctrl</kbd> + <kbd>x,e</kbd>      | Open command in editor                              |
| <kbd>Ctrl</kbd> + <kbd>y</kbd>        | Paste                                               |
| <kbd>Esc</kbd> + <kbd>t</kbd>         | Swap the last two words before the cursor           |
| `!*`                                  | All arguments of previous command                   |

## Process 📊

| Keybinding                     | Action                    |
| ------------------------------ | ------------------------- |
| <kbd>Ctrl</kbd> + <kbd>c</kbd> | Interrupt/Kill            |
| <kbd>Ctrl</kbd> + <kbd>d</kbd> | Close current shell       |
| <kbd>Ctrl</kbd> + <kbd>l</kbd> | Clear screen              |
| <kbd>Ctrl</kbd> + <kbd>z</kbd> | Background/Foreground job |

## History ⏳

| Keybinding                     | Action                                       |
| ------------------------------ | -------------------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>r</kbd> | History search                               |
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | Go back to the next most recent command      |
| `^abc^def`                     | Run previous command, replacing abc with def |

## Modes 🕹️

| Keybinding                       | Action        |
| -------------------------------- | ------------- |
| <kbd>Ctrl</kbd> + <kbd>x,v</kbd> | vi mode (zsh) |
| `bindkey -e`                     | Emacs mode    |
| `set -o vi` / `bindkey -v`       | Vi mode       |

GitHub gist [here](https://gist.github.com/9c6d607e160b0439a186d4fbd1bd81df).
