# Dotfiles

My personal config files for everyone to use. Sadly this repo gets frequent commits. 😌😉

![Terminal](https://i.imgur.com/bsHwUz4.png)

## Setup

Run `dot.sh` for seting up, other specific steps given below.
You can run `dot.sh` with `-i` or `--install` flags to install requirements.

```bash
sh dot.sh # For setting up symlinks
sh dot.sh -i # For installing dependencies
```

### Included Configurations

* compiz : `~/.config/compiz.profile`
* conky : `~/.config/conky_sysinfo`
* dmenu : `~/.dmenurc`
* git : `~/.gitconfig`
* i3 : `~/.config/i3/config`
* i3status : `~/.config/i3status/config`
* libinbut : `~/.config/libinput-gestures.conf`
* ranger : `~/.config/ranger/`
* tmux : `~/.tmux.conf`
* vim : `~/.vimrc`
* xrdb : `~/.Xresources`
* zsh : `~/.zshrc`

> This repo also contains a few scripts in the `Scripts` directory.

### Long Term Branches

There is one other branch:

* `termux` - Has specific tweaks for Termux and small screen usage.
