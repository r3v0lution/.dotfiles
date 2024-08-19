#!/bin/zsh
#
# install script for first time start up
sudo apt update
sudo apt install -y gpg

# install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update


sudo apt -y eza \
	install \
	zsh \
	git \
	neovim \
	stow \
	ripgrep \
	bat \

# install fzf from github
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# add zsh to login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# stow .dotfiles
stow nvim
stow zsh
stow p10k

# install neovim plugins
#nvim --headless +PlugInstall +qall


source ~/.zshrc
