#!/usr/bin/env bash

# Global variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

deploy_vim() {
    check_for_software vim
    echo "Appending source command to ~/.vimrc"
    echo "so ${DIR}/vim/vimrc.vim" >> ~/.vimrc
    echo "Deployed"
    exit
}

deploy_vim_plugins() {
    check_for_software vim
    echo "Insert source command at the start of ~/.vimrc"
    echo "so ${DIR}/vim-plugins/vim-plugins.vim" | cat - ~/.vimrc > temp && mv temp ~/.vimrc
    echo "Install Plugins"
    vim +"set sh=sh" +PluginInstall +qall
    echo "Deployed"
    exit
}

update_vim_plugins() {
    echo "Install/Update Plugins"
    vim +"set sh=sh" +PluginInstall +qall
    echo "Updated"
    exit
}

deploy_tmux() {
    check_for_software tmux
    echo "Appending source command to ~/.tmux.conf"
    echo "source-file ${DIR}/tmux/tmux.conf" >> ~/.tmux.conf
    echo "Deployed"
    exit
}

# main
echo "Which dotfiles do you want to deploy?"
echo "[1] Deploy: vim"
echo "[2] Deploy: vim-plugins"
echo "[3] Update: vim-plugins"
echo "[4] Deploy: tmux"
echo "[_] quit"

read -s -n 1 answer
echo $answer

if [ "1" == "$answer" ]; then
    deploy_vim
elif [ "2" == "$answer" ]; then
    deploy_vim_plugins
elif [ "3" == "$answer" ]; then
    update_vim_plugins
elif [ "4" == "$answer" ]; then
    deploy_tmux
fi

echo "quit..."
