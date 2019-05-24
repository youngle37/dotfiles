OHMYZSH = ~/.oh-my-zsh
DIR = $(shell pwd)

.PHONY: default vim zsh all

default:
	@echo 'Missing one argument.'

vim:
	@echo 'Setting up vim...'
	@rm -rf ~/.vim ~/.vimrc
	@sh $(DIR)/vim/install.sh $(DIR)
	@echo 'Vim finished.'

zsh:
	@echo 'Setting up zsh...'
	@sh $(DIR)/zsh/install.sh $(DIR) $(OHMYZSH)
	@cp -a $(DIR)/zsh/zshrc ~/.zshrc
	@echo 'Zsh finished.'

all: vim zsh
	@echo 'All setting finished.'
