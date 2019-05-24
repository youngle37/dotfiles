#!/usr/bin/env sh

CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$CURRENT_SHELL" != "zsh" ]; then
    if hash chsh >/dev/null 2>&1; then
        printf "\e[1;34mChange your default shell to zsh.\e[0m\n"
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
    else
        printf "\e[1;31mPlease manually change your default shell to zsh.\e[0m\n"
    fi
fi
