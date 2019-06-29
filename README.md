# Dotfiles

My personal config files for everyone to use.
Sadly this repo gets frequent commits. 😌😉

![Terminal](https://i.imgur.com/bsHwUz4.png)

## Usage

Run `setup.sh` for seting up, other specific steps given below.
You can run `setup.sh` with `-i` or `--install` flags to install requirements.

```bash
sh setup.sh
```

### Vim

Requirements:

* [Vundle](https://github.com/VundleVim/Vundle.vim)

### Zsh

Requirements:

* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Powerlevel9k](https://github.com/bhilburn/powerlevel9k)

### Compiz

Import  `Compiz.profile` from preferences inside CompizConfig Settings Manager.

### Conky

`Conky_Sysinfo` goes into ~/.conky/, start conky with this command.

```bash
conky -c ~/.conky/Conky_Sysinfo
```

You can also use Conky Manager.

### Long Term Branches

There are also two other branches:
`termux` - Has specific tweaks for Termux and small screen usage.
`lite` - Has no powerline glyphs, ideal for ssh.
