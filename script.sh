#!/bin/bash

install_mp()
{
    local REQUIRED_PACKAGE=$(dpkg-query -W --showformat='${Status}\n' $1|grep "install ok installed")
    if [ "" == "$REQUIRED_PACKAGE" ]; then
        printf "$1 is not installed. Settings up $1.\n\n"
        sudo apt-get --yes install $1
    else
        printf "$1 is already installed.\n\n"
    fi
}

install_mp "tmux"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2>/dev/null
cp tmux/.tmux.conf /home/$(whoami)/.tmux.conf 2>/dev/null

printf "In order to source the tmux.conf file, you need to launch tmux and press: CTRL-s I\n"
