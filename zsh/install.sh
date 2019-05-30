#!/usr/bin/env sh

DIR=$1
OHMYZSH=$2

# zsh
if ! hash zsh >/dev/null 2>&1; then
    echo 'Installing zsh.'

    if [ "$EUID" -ne 0 ]; then
        echo 'Need to run as root to install zsh. Try sudo.'
        exit 1
    fi

    if hash brew >/dev/null 2>&1; then
        brew install zsh
    elif hash apt-get >/dev/null 2>&1; then
        apt-get install -y zsh
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
sh $DIR/zsh/chsh.sh
