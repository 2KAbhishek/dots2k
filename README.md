# Dotfiles

![Size](https://img.shields.io/github/repo-size/2kabhishek/Dotfiles?style=plastic&color=0f0&label=Size)
![Updated](https://img.shields.io/github/last-commit/2kabhishek/Dotfiles?style=plastic&color=f00&label=Updated)
![Stars](https://img.shields.io/github/stars/2kabhishek/Dotfiles?style=plastic&color=ffc801&label=Stars)
![Forks](https://img.shields.io/github/forks/2kabhishek/Dotfiles?style=plastic&color=003cff&label=Forks)
![Watchers](https://img.shields.io/github/watchers/2kabhishek/Dotfiles?style=plastic&color=ff5500&label=Watchers)
![Contributors](https://img.shields.io/github/contributors/2kabhishek/Dotfiles?style=plastic&color=f0f&label=Contributors)
![License](https://img.shields.io/github/license/2kabhishek/Dotfiles?style=plastic&color=555&label=License)

My personal configs, carefully and passionately crafted for setting up an optimal CLI dev experience.
![Terminal](https://i.imgur.com/XOJlQXU.png)


## Setup

```bash
git clone https://github.com/2kabhishek/BareMinimum
cd BareMinimum
./setup # It shows a menu from where you can install required components
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

* conky : [~/.config/sysinfo.conkyrc](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/sysinfo.conkyrc)

> Run conky with `conky -dqc ~/.config/sysinfo.conkyrc`.

* broot : [~/.config/broot/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/broot/)
* cmus : [~/.config/cmus/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/cmus/)
* dmenu : [~/.dmenurc](https://github.com/2KAbhishek/Dotfiles/blob/master/.dmenurc)
* fontconfig : [~/.config/fontconfig/fonts.conf/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/fontconfig/fonts.conf/)
* git : [~/.gitconfig](https://github.com/2KAbhishek/Dotfiles/blob/master/.gitconfig)
* htop : [~/.config/htop/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/htop/)
* i3 : [~/.config/i3/config](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/i3/config)
* i3status : [~/.config/i3status/config](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/i3status/config)
* konsole : [~/.local/share/konsole/](https://github.com/2KAbhishek/Dotfiles/blob/master/.local/share/konsole)

> Open Konsole, Goto Settings -> Manage Profiles -> Check `Konsole` and click on Set as Default.

* libinbut : [~/.config/libinput-gestures.conf](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/libinput-gestures.conf)
* neovim : [~/.config/nvim/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/nvim/)
* python : [~/.pystartup](https://github.com/2KAbhishek/Dotfiles/blob/master/.pystartup)
* ranger : [~/.config/ranger/](https://github.com/2KAbhishek/Dotfiles/blob/master/.config/ranger/)
* tmux : [~/.tmux.conf](https://github.com/2KAbhishek/Dotfiles/blob/master/.tmux.conf)
* vim : [~/.vimrc](https://github.com/2KAbhishek/Dotfiles/blob/master/.vimrc)
* xrdb : [~/.Xresources](https://github.com/2KAbhishek/Dotfiles/blob/master/.Xresources)
* zsh : [~/.zshrc](https://github.com/2KAbhishek/Dotfiles/blob/master/.zshrc)

> This repo also contains a few scripts in the [Scripts](https://github.com/2KAbhishek/Dotfiles/blob/master/Scripts) directory.


