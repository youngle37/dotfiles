#!/usr/bin/env sh

CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$CURRENT_SHELL" != "zsh" ]; then

    if [ "$EUID" != "0" ]; then
        printf "\e[1;31mNeed to run as root to change default shell to zsh. Try sudo.\e[0m\n"
        exit 1
    fi

    if hash chsh >/dev/null 2>&1; then
        printf "\e[1;34mChange your default shell to zsh.\e[0m\n"
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
    else
        printf "\e[1;31mPlease manually change your default shell to zsh.\e[0m\n"
    fi
else
    echo 'Current shell has already been zsh.'
fi
