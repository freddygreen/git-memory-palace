#!/bin/bash
#
##################################################################################################################
# Script:              setup-git-v1.sh
# Original Author:     Erik DuBois
# Modifying Author:    Fred Green
##################################################################################################################
##################################################################################################################
#
#   CAVEAT EMPTOR. DRIVING ON LEARNER'S PERMIT. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Installing git by specific OS distribution, if not already installed.

if ! location="$(type -p "git")" || [ -z "git" ]; then

    echo "#################################################"
    echo "Installing git to ensure that this script works.
    echo "#################################################"

    sudo apt install git -y
    # check for apt-get
    if which apt-get > /dev/null; then
	sudo apt-get install -y git
    fi

    # check for pacman
    if which pacman > /dev/null; then
	sudo pacman -S --noconfirm git
    fi

    # check for eopkg
    if which eopkg > /dev/null; then
	sudo eopkg -y install git
    fi
fi

# Git setup. To enforce local visibility, edit user name & email prior to this script's execution

git init
git config --global user.name "username"
git config --global user.email "email"
sudo git config --system core.editor vim
git config --global credential.helper.cache
git config --global credential.helper 'cache --timeout=100000'
git config --global push.default simple

echo "################################################################"
echo "#############    End of setup-git-v1.sh script    ##############"
echo "################################################################"
