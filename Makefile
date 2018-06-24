DIR = $(shell pwd)

.PHONY: default vim all

default:
	@echo 'Missing one argument.'

vim:
	@echo 'Setting up vim...'
	@rm -rf ~/.vim ~/.vimrc
	@git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@cp -a $(DIR)/vim/vim/. ~/.vim/
	@cat $(DIR)/vim/vundle >> ~/.vimrc
	@vim +PluginInstall +qall
	@cat $(DIR)/vim/default >> ~/.vimrc

all: vim
	@echo 'Setting finished.'
