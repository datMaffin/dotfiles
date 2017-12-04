#!/usr/bin/env bash

check_for_software() {
	echo "Checking to see if $1 is installed"
	if ! [ -x "$(command -v $1)" ]; then
		echo "$1 is NOT installed."
		echo "Please install $1 and try again."
		exit
	else
		echo "$1 is installed."
	fi
}

echo "We're going to do the following:"
echo "1. Check to make sure you have bash, vim, and tmux installed"
echo "2. Back up your old configuration files."

echo "Let's get started? (y/n)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
	echo 
else
	echo "Quitting, nothing was changed."
	exit 0
fi


check_for_software bash
echo 
check_for_software vim
echo
check_for_software tmux
echo

echo
echo -n "Would you like to backup your current dotfiles? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        mv ~/.bash_profile ~/.bash_profile.old
    else
        mv ~/.bashrc ~/.bashrc.old
    fi
    mv ~/.tmux.conf ~/.tmux.conf.old
    mv ~/.vimrc ~/.vimrc.old
else
	echo -e "\nNot backing up old dotfiles."
fi


#if [[ "$OSTYPE" == "darwin"* ]]; then
#    printf "source '$HOME/dotfiles/bash/bashrc.sh'" >> ~/.bash_profile
#else
#    printf "source '$HOME/dotfiles/bash/bashrc.sh'" >> ~/.bashrc
#fi

printf "so $HOME/dotfiles/vim/vimrc.vim" >> ~/.vimrc
printf "source-file $HOME/dotfiles/tmux/tmux.conf" >> ~/.tmux.conf

echo
echo "Please log out and log back in for default shell to be initialized."
