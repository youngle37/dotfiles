DIR = $(shell pwd)

.PHONY: default vim all

default:
	@echo 'Missing one argument.'

vim:
	@echo 'Setting up vim...'
	@rm -rf ~/.vim ~/.vimrc
	@git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@cp -a $(DIR)/vim/vim/. ~/.vim/
	@cat $(DIR)/vim/vimrc/vundle.vim >> ~/.vimrc
	@vim +PluginInstall +qall
	@cat $(DIR)/vim/vimrc/default.vim >> ~/.vimrc

all: vim
	@echo 'Setting finished.'
