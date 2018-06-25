DIR=$1
OHMYZSH=$2

test -d $OHMYZSH && exit 1

# Download oh-my-zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $OHMYZSH
