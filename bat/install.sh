DIR=$1

if ! hash bat >/dev/null 2>&1; then
    echo 'Installing bat.'
    if [[ $OSTYPE == darwin* ]]; then
        # OS X
        brew install bat
    else
        echo 'Unknown package manager.'
        exit 1
    fi
else
    echo 'Skip installing bat.'
fi

# Create config & themes folder
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
# TODO Install theme using git clone or cp from other place

# Copy config file
cp $DIR/bat/config $(bat --config-file)
