#!/bin/bash
sudo apt update && sudo apt upgrade

curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "
plugins=(git)
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)" > $HOME/.zshrc
cp ./.config/starship.toml $HOME/.config/starship.toml
