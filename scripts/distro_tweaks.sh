#!/bin/bash

distro=$(\grep --color=auto ^ID= /etc/os-release |cut -f 2 -d =)
color=""

case $distro in
    "manjaro")
        color="044"
        ;;
    "ubuntu")
        color="202"
        echo "alias cat=batcat" >> ~/.shrc.local
        ;;
    "arch")
        color="033"
        ;;
    "debian")
        color="163"
        echo "alias cat=batcat" >> ~/.shrc.local
        ;;
    "kali")
        color="white"
        ;;
    *)
        color="darkcyan"
        ;;
esac

# sed -i '/searchtext/c\linetochangeitwith' file
echo "POWERLEVEL9K_OS_ICON_BACKGROUND='$color'" >> ~/.local.sh
echo "POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{238}╰%F{$color}%K{$color}%F{black}  %f%F{$color}%k%f'" >> ~/.local.sh

