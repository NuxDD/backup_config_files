#!/bin/bash

USER=`whoami`

# initial setup for WSL2 on W10
if grep -q Microsoft /proc/version; then
	$WUSER=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%')
	ln -s "/mnt/c/Users/$WUSER" ~/winhome
	if [ ! -d "/mnt/c/Users/$WUSER/repos" ]; then
		mkdir "/mnt/c/Users/$WUSER/repos"
	fi
	ln -s "/mnt/c/Users/$WUSER/repos" ~/repos
fi

# just a sanity check to create the repos folder on a native Linux system
if [ ! -d ~/repos ]; then
	mkdir ~/repos
fi

# touching the file to avoid an unnecessary push while using checkUpdate.sh
cp ./files/.vimrc ~/ & touch -m ./files/.vimrc
cp ./files/.ycm_extra_conf.py ~/repos & touch -m ./files/.ycm_extra_conf.py

# set zsh as the default shell if it is installed on the system
# copy the config file and install the zsh-syntax-highlighting
if type zsh > /dev/null; then
	chsh -s $(which zsh)
	cp ./files/.zshrc ~/ & touch -m ./files/.zshrc
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh/
fi