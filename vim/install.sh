DIR=$1

# Download Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy the vim setting file
cp -a $DIR/vim/vim/. ~/.vim/

# Add vundle setting
cat $DIR/vim/vimrc/vundle.vim >> ~/.vimrc

# Install vundle plugin
vim +PluginInstall +qall

# Add my .vimrc setting
cat $DIR/vim/vimrc/vimrc.vim >> ~/.vimrc
