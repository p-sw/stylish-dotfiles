#!/bin/bash
sudo apt update -y && sudo apt upgrade -y

curl -sS https://starship.rs/install.sh | sh --yes
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "
plugins=(git)
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)" > $HOME/.zshrc
cp ./.config/starship.toml $HOME/.config/starship.toml
