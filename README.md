### .dotfiles repo

# Installs list of predetermined packages
 `sudo apt install \
	zsh \
	git \
	neovim \
	stow \
	fzf \
	ripgrep \
	bat \`

# Stows dotfiles containing package configs
`stow nvim
stow zsh
stow p10k`

# Adds zsh to login shells & changes default shell
`command -v zsh | sudo tee -a /etc/shells`
`sudo chsh -s $(which zsh) $USER`

# Install neovim plugins
`nvim --headless +PlugInstall +qall`


## Issues

