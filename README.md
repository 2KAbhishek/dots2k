# Dotfiles

My personal config files for everyone to use. Sadly this repo gets frequent commits. 😌😉

![Terminal](https://i.imgur.com/XOJlQXU.png)

## Setup

Run `dotfiles` for setting up, it shows a menu from where you can install required components.

```bash
./dotfiles # May have to run multiple times.
```

### Requirements

For installation `git` `curl` & `zsh` are must, other tools are mentioned below.

Powerline patched fonts are required for glyphs. I'll recommend [Nerd Fonts](https://www.nerdfonts.com/).

### Included Configurations

This repo contains configurations for following tools.
Most of their symlinks are set up by default but for tools like  `conky` and `compiz` you have to follow additional steps mentioned below.
Check respective tools documentation for more info.

* compiz : [~/.config/compiz.profile](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/compiz.profile)

> Import the compiz profile using `ccsm`.

* conky : [~/.config/conky_sysinfo](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/conky_sysinfo)

> Run conky with `conky -c ~/.config/conky_sysinfo`.

* dmenu : [~/.dmenurc](https://github.com/2KAbhishek/Dotfiles/blob/master/.dmenurc)
* git : [~/.gitconfig](https://github.com/2KAbhishek/Dotfiles/blob/master/.gitconfig)
* htop : [~/.config/htop/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/htop/)
* i3 : [~/.config/i3/config](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/i3/config)
* i3status : [~/.config/i3status/config](https://github.com/2KAbhishek/Dotfiles/blob/master/)
* konsole : [~/.local/share/konsole/](https://github.com/2KAbhishek/Dotfiles/blob/master/.local/share/konsole)

> Open Konsole, Goto Settings -> Manage Profiles -> Check `Konsole` and click on Set as Default.

* libinbut : [~/.config/libinput-gestures.conf](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/libinput-gestures.conf)
* ranger : [~/.config/ranger/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/ranger/)
* tmux : [~/.tmux.conf](https://github.com/2KAbhishek/Dotfiles/blob/master/.tmux.conf)
* vim : [~/.vimrc](https://github.com/2KAbhishek/Dotfiles/blob/master/.vimrc)
* xrdb : [~/.Xresources](https://github.com/2KAbhishek/Dotfiles/blob/master/.Xresources)
* zsh : [~/.zshrc](https://github.com/2KAbhishek/Dotfiles/blob/master/.zshrc)

> This repo also contains a few scripts in the [Scripts](https://github.com/2KAbhishek/Dotfiles/blob/master/Scripts) directory.

### Long Term Branches

There is one other branch:

* [termux](https://github.com/2KAbhishek/Dotfiles/tree/termux) - Has specific tweaks for Termux and small screen usage.
