#!/bin/zsh
#
# install script for first time start up


sudo apt install \
	zsh \
	git \
	neovim \
	stow \
	fzf \
	ripgrep \
	bat \

# stow .dotfiles

stow nvim
stow zsh
stow p10k

# add zsh to login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install neovim plugins
nvim --headless +PlugInstall +qall
