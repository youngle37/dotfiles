DIR = $(shell pwd)

.PHONY: default vim all

default:
	@echo 'Missing one argument.'

vim:
	@echo 'Setting up vim...'
	@git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@ln -sf $(DIR)/vim/vimrc ~/.vimrc
	@vim +PluginInstall +qall

all: vim
	@echo 'Setting finished.'
