#!/bin/bash
#Bash Script wrapper for wttr.in
city=$1

case $2 in
"-color" | "-c")
    curl wttr.in/"$city"| lolcat
    ;;
*)
    curl wttr.in/"$city" 
    ;;
esac
