#!/bin/bash
# Commands
eval "$(dircolors ~/.dircolors)";

test -f ~/usr/share/nvm/init-nvm.sh && source ~/usr/share/nvm/init-nvm.sh

if [ -f "/home/abhishek/.config/broot/launcher/bash/br" ]; then
    source /home/abhishek/.config/broot/launcher/bash/br
fi
