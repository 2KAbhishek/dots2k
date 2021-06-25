# Dotfiles

![Size](https://img.shields.io/github/repo-size/2kabhishek/Dotfiles?style=plastic&color=0f0&label=Size)
![Updated](https://img.shields.io/github/last-commit/2kabhishek/Dotfiles?style=plastic&color=f00&label=Updated)
![Stars](https://img.shields.io/github/stars/2kabhishek/Dotfiles?style=plastic&color=ffc801&label=Stars)
![Forks](https://img.shields.io/github/forks/2kabhishek/Dotfiles?style=plastic&color=003cff&label=Forks)
![Watchers](https://img.shields.io/github/watchers/2kabhishek/Dotfiles?style=plastic&color=ff5500&label=Watchers)
![Contributors](https://img.shields.io/github/contributors/2kabhishek/Dotfiles?style=plastic&color=f0f&label=Contributors)
![License](https://img.shields.io/github/license/2kabhishek/Dotfiles?style=plastic&color=555&label=License)

![Terminal](https://i.imgur.com/XOJlQXU.png)

My personal configs, carefully and passionately crafted for setting up an optimal CLI dev experience.

## Setup

```bash
git clone https://github.com/2kabhishek/Dotfiles
cd Dotfiles
./setup.sh # It shows a menu from where you can install required components
```

## Requirements

For installation `git` `curl` & `zsh` are must, other tools are mentioned below.

### Packages

- xdotool, libinput

Powerline patched fonts are required for glyphs. I'll recommend [Nerd Fonts](https://www.nerdfonts.com/).

### Included Configurations

This repo contains configurations for following tools.

- bash : [~/.bashrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.bashrc)
- bat : [~/.config/bat/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/bat/)
- broot : [~/.config/broot/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/broot/)
- cmus : [~/.config/cmus/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/cmus/)
- dmenu : [~/.dmenurc](https://github.com/2KAbhishek/Dotfiles/blob/main/.dmenurc)
- dircolors : [~/.dircolors](https://github.com/2KAbhishek/Dotfiles/blob/main/.dircolors)
- fontconfig : [~/.config/fontconfig/fonts.conf/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/fontconfig/fonts.conf/)
- git : [~/.gitconfig](https://github.com/2KAbhishek/Dotfiles/blob/main/.gitconfig)
- htop : [~/.config/htop/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/htop/)
- i3 : [~/.config/i3/config](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/i3/config)
- i3status : [~/.config/i3status/config](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/i3status/config)
- libinbut : [~/.config/libinput-gestures.conf](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/libinput-gestures.conf)
- neovim : [~/.config/nvim/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/nvim/)
- python : [~/.pystartup](https://github.com/2KAbhishek/Dotfiles/blob/main/.pystartup)
- ranger : [~/.config/ranger/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/ranger/)
- tmux : [~/.tmux.conf](https://github.com/2KAbhishek/Dotfiles/blob/main/.tmux.conf)
- vim : [~/.vimrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.vimrc)
- xrdb : [~/.Xresources](https://github.com/2KAbhishek/Dotfiles/blob/main/.Xresources)
- zsh : [~/.zshrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.zshrc)

Some configs require some more steps in order to use. Check respective tools documentation for more info.

- compiz : [~/.config/compiz.profile](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/compiz.profile)

> Import the compiz profile using `ccsm`.

- conky : [~/.config/sysinfo.conkyrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/sysinfo.conkyrc)

> Run conky with `conky -dqc ~/.config/sysinfo.conkyrc`.

- konsole : [~/.local/share/konsole/](https://github.com/2KAbhishek/Dotfiles/blob/main/.local/share/konsole)

> Open Konsole, Goto Settings -> Manage Profiles -> Check `Konsole` and click on Set as Default.

This repo also contains a few scripts in the [scripts](https://github.com/2KAbhishek/Dotfiles/blob/main/scripts) directory.
