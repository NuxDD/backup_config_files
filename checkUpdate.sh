#!/bin/bash

# This script is only to check if local config files have been updated to update the files on the repo, don't use it.

USER=`whoami`
GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'

function check {
	repoDate=$(stat -c %Y "./files/$1")
	localDate=$(stat -c %Y "/home/$USER/$1")
	if [[ $repoDate == $localDate ]]; then
		echo -e "${GREEN} $1 is up-to-date. ${NC}"
	elif [[ $repoDate -lt $localDate ]]; then
		echo -e "${GREEN} Updating $1.. ${NC}"
		# Need to touch in order to get the up-to-date for later
		cp /home/$USER/$1 ./files/ & touch /home/$USER/$1
		git add ./files/$1
	else
		echo -e "${RED} The local $1 is outdated, please use the associated script to update it. ${NC}"
	fi
}

# Simple sanity check about the dependency
if type git > /dev/null; then
	check .bashrc
	check .vimrc
fi

git commit -m "update config files"
git push
