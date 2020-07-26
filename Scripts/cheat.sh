#!/bin/bash
#Bash Script wrapper for cheat.sh
topic=$2

case $1 in
"--color" | "-c")
    curl cheat.sh/$topic | lolcat
    ;;
"--pager" | "-p")
    curl cheat.sh/$topic | less
    ;;
"--help" | "-h")
    echo "-p for pager\n -c for colorized output"
    ;;
*)
    curl cheat.sh/$1
    ;;
esac
