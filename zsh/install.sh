#!/usr/bin/env sh

DIR=$1
OHMYZSH=$2
CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')

# zsh
if ! hash zsh >/dev/null 2>&1; then
    echo 'Installing zsh.'
    if hash brew >/dev/null 2>&1; then
        sudo brew install zsh
    elif hash apt-get >/dev/null 2>&1; then
        sudo apt-get install -y zsh
    else
        echo 'Unknown package manager.'
        exit 1
    fi
else
    echo 'Skip installing zsh.'
fi

# oh-my-zsh
if [ ! -d $OHMYZSH ]; then
    echo 'Installing oh-my-zsh.'
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $OHMYZSH
else
    echo 'Skip installing oh-my-zsh.'
fi

# zsh-syntax-highlighting
if [ ! -d $OHMYZSH/custom/plugins/zsh-syntax-highlighting ]; then
    echo 'Installing oh-my-zsh plugins (zsh-syntax-highlighting).'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$OHMYZSH/custom}/plugins/zsh-syntax-highlighting
else
    echo 'Skip installing zsh-syntax-highlighting.'
fi

# zsh-autosuggestions
if [ ! -d $OHMYZSH/custom/plugins/zsh-autosuggestions ]; then
    echo 'Installing oh-my-zsh plugins (zsh-autosuggestions).'
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$OHMYZSH/custom}/plugins/zsh-autosuggestions
else
    echo 'Skip installing zsh-autosuggestions.'
fi

# zsh-completions
if [ ! -d $OHMYZSH/custom/plugins/zsh-completions ]; then
    echo 'Installing oh-my-zsh plugins (zsh-autosuggestions).'
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-$OHMYZSH/custom}/plugins/zsh-completions
else
    echo 'Skip installing zsh-completions.'
fi

# change default shell
if [ "$CURRENT_SHELL" != "zsh" ]; then
    if hash chsh >/dev/null 2>&1; then
        printf "\e[1;34mChange your default shell to zsh.\e[0m\n"
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
    else
        printf "\e[1;31mPlease manually change your default shell to zsh.\e[0m\n"
    fi
else
    echo 'Current shell has already been zsh.'
fi
