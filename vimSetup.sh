#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if type vim git cmake python3 > /dev/null; then

	USER=`whoami`

	# Copy of the .vimrc
	echo -e "${GREEN} Copying the .vimrc.. ${NC}"
	cp ./files/.vimrc /home/$USER/.vim
	
	# Add undodir for the vim option -- look at .vimrc
	echo -e "${GREEN} Configuring undodir..${NC}"
	mkdir -p ~/.vim/undodir

	# Download VIM colosheme Badwolf
	echo -e "$GREEN Installing Badwolf colorscheme..${NC}"
	mkdir -p /home/$USER/.vim/colors
	wget -O /home/$USER/.vim/colors/badwolf.vim https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

	mkdir -p /home/$USER/.vim/bundle
	# Install Vundle for plugins
	echo -e "${GREEN} Installing Vundle plugin..${NC}"
	git clone https://github.com/VundleVim/Vundle.vim.git /home/$USER/.vim/bundle/Vundle.vim

	# Install and configure YouCompleteMe (YCM) plugin
	echo -e "${GREEN} Installing YouCompleteMe plugin..${NC}"
	git clone https://github.com/ycm-core/YouCompleteMe /home/$USER/.vim/bundle/YouCompleteMe
	echo -e "${GREEN} Configuring YouCompleteMe plugin..${NC}"
	cd /home/$USER/.vim/bundle/YouCompleteMe
	git submodule update --init --recursive
	python3 /home/$USER/.vim/bundle/YouCompleteMe/install.py --clang-completer
	cd ~
	mkdir -p /home/$USER/repos
	cp ./files/.ycm_extra_conf.py /home/$USER/repos

	# Install NerdTree plugin
	echo -e "${GREEN} Installing NerdTree plugin..${NC}"
	git clone https://github.com/preservim/nerdtree /home/$USER/.vim/bundle/nerdtree

	# Install vim-cpp-enhanced-highlight plugin
	echo -e "${GREEN} Installing vim-cpp-enhanced-highlight plugin..${NC}"
	git clone https://github.com/octol/vim-cpp-enhanced-highlight /home/$USER/.vim/bundle/vim-cpp-enhanced-highlight

	#TODO: need to add the statusline install
	echo -e "${GREEN} Done. ${NC}"

else
	echo -e "${RED}Please refer to the README.MD to install the dependencies.${NC}" 
fi

