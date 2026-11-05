#!/bin/bash

#
# Installs Oh My Zsh if needed.
# Must run before setup-zshrc.sh, since the installer replaces ~/.zshrc.
#

if [ -d "$HOME/.oh-my-zsh" ]
then
        echo "Oh My Zsh is already installed"
else
        echo "Installing Oh My Zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
