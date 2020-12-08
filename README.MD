Backup of configuration files
==============================

Simply a backup from various configuration files and scripts to install plugins etc..

I made the choice to write scripts as bash instead of zsh since it is the default shell of most of the main linux distro.

Dependencies
------------
For the `vimSetup.sh` script :

* vim
* git
* cmake
* python3
* wget

For the `checkUpdate.sh` script :

* git

Usage 
-----

All scripts are supposed to be executed from the root of the repo.

Dependencies installation and usage of `vimSetup.sh` on ArchLinux :

    pacman -S gvim git cmake python3 && ./vimSetup.sh

Todos and issues
----------------

* Rewrite the `checkUpdate.sh` function to add path (exemple : the .ycm_extra_conf.py isn't on ~/)
* Add the tmux conf to copy tmux buffer to os clipboard
