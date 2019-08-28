#!/bin/bash
#Bash Script wrapper for wttr.in
city=$1

case $2 in
"-color" | "-c")
    curl v2.wttr.in/"$city"| lolcat
    ;;
*)
    curl v2.wttr.in/"$city" 
    ;;
esac
