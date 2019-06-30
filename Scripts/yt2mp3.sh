#!/bin/bash
#Bash Script to download youtube link as mp3
url=$1

youtube-dl -f 140 $url -o out.m4a &&
ffmpeg -i out.m4a -acodec mp3 -ac 2 -ab 192k "$2"
rm -v out.m4a
