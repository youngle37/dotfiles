GIT_NAME = YoungLe
GIT_EMAIL = contact@youngle.work

OHMYZSH = ~/.oh-my-zsh
DIR = $(shell pwd)

.PHONY: default git vim zsh all

default:
	@echo 'Missing one argument.'

git:
	@echo 'GIT_NAME:' $(GIT_NAME)
	@echo 'GIT_EMAIL:' $(GIT_EMAIL)
	@echo 'Are you sure to set git? [y/N]' && read ans && [ $${ans:-N} = y ]
	@echo 'Setting up git...'
	git config --global core.editor "vim"
	git config --global --replace-all user.name $(GIT_NAME)
	git config --global --replace-all user.email $(GIT_EMAIL)

vim:
	@echo 'Are you sure to set vim? [y/N]' && read ans && [ $${ans:-N} = y ]
	@echo 'Setting up vim...'
	@rm -rf ~/.vim ~/.vimrc
	@sh $(DIR)/vim/install.sh $(DIR)
	@echo 'Vim finished.'

zsh:
	@echo 'Are you sure to set zsh? [y/N]' && read ans && [ $${ans:-N} = y ]
	@echo 'Setting up zsh...'
	@sh $(DIR)/zsh/install.sh $(DIR) $(OHMYZSH)
	@cp -a $(DIR)/zsh/zshrc ~/.zshrc
	@echo 'Zsh finished.'

all: git vim zsh
	@echo 'All setting finished.'
