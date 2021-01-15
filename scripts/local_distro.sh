#!/env/ bash

distro=$(\grep --color=auto ^ID= /etc/os-release |cut -f 2 -d =)
color=""

case $distro in
    "manjaro")
        color="041"
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
        color="000"
        ;;
    *)
        color="darkcyan"
        ;;
esac

# sed -i '/searchtext/c\linetochangeitwith' file
echo "POWERLEVEL9K_OS_ICON_FOREGROUND='$color'" >> ~/.shrc.local

