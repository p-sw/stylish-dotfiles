#!/bin/bash
echo "
[settings]
api_key = waka_2dc69c6d-3ab3-4735-abc8-f2451ac533f0" > $HOME/.wakatime.cfg

sudo apt update -y && sudo apt upgrade -y

curl -sS --out $HOME/starship.sh https://starship.rs/install.sh && sh $HOME/starship.sh -y
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "
plugins=(git)
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval \"$(starship init zsh)\"" > $HOME/.zshrc

cp ./.config/starship.toml $HOME/.config/starship.toml
