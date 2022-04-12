<div align = "center">

<h1><a href="https://2kabhishek.github.io/Dotfiles">Dotfiles</a></h1>

<a href="https://github.com/2KAbhishek/Dotfiles/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/Dotfiles?style=plastic&color=white&label=License"> </a>

<a href="https://github.com/2KAbhishek/Dotfiles/pulse">
<img alt="Updated" src="https://img.shields.io/github/last-commit/2kabhishek/Dotfiles?style=plastic&color=e30724&label=Updated"> </a>

<a href="https://github.com/2KAbhishek/Dotfiles/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/Dotfiles?style=plastic&color=00d451&label=Stars"></a>

<a href="https://github.com/2KAbhishek/Dotfiles/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/Dotfiles?style=plastic&color=1688f0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/Dotfiles/watchers">
<img alt="Watchers" src="https://img.shields.io/github/watchers/2kabhishek/Dotfiles?style=plastic&color=ff5500&label=Watchers"> </a>

<a href="https://github.com/2KAbhishek/Dotfiles/graphs/contributors">
<img alt="Contributors" src="https://img.shields.io/github/contributors/2kabhishek/Dotfiles?style=plastic&color=f0f&label=Contributors"> </a>

<a href="https://github.com/2KAbhishek?tab=followers">
<img alt="Followers" src="https://img.shields.io/github/followers/2kabhishek?color=222&style=plastic&label=Followers"> </a>

<h3>Passionately crafted configs for CLI lovers 🐧❤️</h3>

<figure>
  <img src= "https://raw.githubusercontent.com/2KAbhishek/Dotfiles/main/images/screenshot.jpg" alt="Dotfiles Demo" style="width:100%">
  <br/>
  <figcaption>Terminal screenshot</figcaption>
</figure>

</div>

## What is this

My personal configs, carefully and passionately crafted for setting up an optimal CLI dev experience.

## Inspiration

Hours and nights spent on the terminal, willingness to improve.

## Setup

```bash
git clone https://github.com/2kabhishek/Dotfiles
cd Dotfiles

# Menu based interactive setup
./setup.sh

# Setup everythin unattended
./setup.sh -a
```

## Requirements

For installation `git` `curl` & `zsh` are must, other tools are mentioned below.

### Packages

This list is not complete, package names may vary depending upon your system and your requirements.

```bash
# Required
git, zsh, neovim, kitty, tmux, git-delta, bat, fd, fzf, fasd, ag(silver_surfer), curl, powerline, xclip, lsd
# Optional
ranger, cmus, xdotool, libinput, htop, python, vim, broot, bash, i3, i3status, dmenu, ncdu, grc, exa, conky, konsole, autorandr, xplr
```

Powerline patched fonts are required for glyphs. I'll recommend [Nerd Fonts](https://www.nerdfonts.com/). I'm using FiraCode.

### Included Configurations

This repo contains configurations for following tools.

- asdf : [~/.asdfrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.asdfrc)
- autorandr : [~/.config/autorandr/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/autorandr/)
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
- kitty : [~/.config/kitty/kitty.conf](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/kitty/kitty.conf)
- libinbut : [~/.config/libinput-gestures.conf](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/libinput-gestures.conf)
- neovim : [~/.config/nvim/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/nvim/)
- python : [~/.pystartup](https://github.com/2KAbhishek/Dotfiles/blob/main/.pystartup)
- ranger : [~/.config/ranger/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/ranger/)
- tmux : [~/.tmux.conf](https://github.com/2KAbhishek/Dotfiles/blob/main/.tmux.conf)
- vim : [~/.vimrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.vimrc)
- xplr : [~/.config/xplr/](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/xplr/)
- xrdb : [~/.Xresources](https://github.com/2KAbhishek/Dotfiles/blob/main/.Xresources)
- zsh : [~/.zshrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.zshrc)

Some configs require special steps in order to use. Check respective tools documentation for more info.

- compiz : [~/.config/compiz.profile](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/compiz.profile)

  Import the compiz profile using `ccsm`.

- conky : [~/.config/sysinfo.conkyrc](https://github.com/2KAbhishek/Dotfiles/blob/main/.config/sysinfo.conkyrc)

  Run conky with `conky -dqc ~/.config/sysinfo.conkyrc`.

- konsole : [~/.local/share/konsole/](https://github.com/2KAbhishek/Dotfiles/blob/main/.local/share/konsole)

  Open Konsole, Goto Settings -> Manage Profiles -> Check `Konsole` and click on Set as Default.

This repo also contains a few scripts in the [scripts](https://github.com/2KAbhishek/Dotfiles/blob/main/scripts) directory.

## How it was built

Dotfiles was built using the internet and sleepless nights.

## Challenges faced

Just getting over the initial learning curve on the command line, failing and trying again :)

## What I learned

While building Dotfiles I have learned to love the command line and it's efficiency, have discovered countless tools and techniques which will serve me for the rest of my days.

## What's next

Planning to add more tools, better management, always updating.

Hit the ⭐ button if you found this useful.

## More Info

Want this CLI experience on your Android too? have a look at [Oh-My-Termux](https://github.com/2kabhishek/Oh-My-Termux)

Find more cool configs and setups at [GitHub does dotfiles](https://dotfiles.github.io/)

<div align="center">

<a href="https://github.com/2KAbhishek/Dotfiles">Source</a> |
<a href="https://2kabhishek.github.io/Dotfiles">Website</a>

</div>
