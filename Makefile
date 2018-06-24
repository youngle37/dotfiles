DIR = $(shell pwd)

.PHONY: default vim all

default:
	@echo 'Missing one argument.'

vim:
	@echo 'Setting up vim...'
	@rm -rf ~/.vim ~/.vimrc
	@git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@cp -a $(DIR)/vim/vim/. ~/.vim/
	@ln -sf $(DIR)/vim/vimrc ~/.vimrc
	@cat $(DIR)/vim/vundle >> $(DIR)/vim/vimrc
	@vim +PluginInstall +qall
	@cat $(DIR)/vim/default >> $(DIR)/vim/vimrc

all: vim
	@echo 'Setting finished.'
