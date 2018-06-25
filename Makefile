OHMYZSH = ~/.oh-my-zsh
DIR = $(shell pwd)

.PHONY: default vim zsh all

default:
	@echo 'Missing one argument.'

vim:
	@echo 'Setting up vim...'
	@rm -rf ~/.vim ~/.vimrc
	@sh $(DIR)/vim/install.sh $(DIR)

zsh:
	@echo 'Setting up zsh...'
	@sh $(DIR)/zsh/install.sh $(DIR) $(OHMYZSH) || echo 'Skip installing Oh My Zsh'
	@cp -a $(DIR)/zsh/zshrc ~/.zshrc

all: vim zsh
	@echo 'Setting finished.'
