#!/bin/bash
# Funny git commit messages

while [[ "$input" != "Y" || "$input" != "y" ]]
do
msg=$(curl whatthecommit.com|\grep '<p>'|sed 's/<p>//g')
echo -e "Commit with \u001b[32;1m '$msg' \u001b[0m? (Y/n)"
read input
if [[ "$input" == "Y" || "$input" == "y" ]];
then git commit -m "$msg"
fi
done
