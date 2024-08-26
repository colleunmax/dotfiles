#!/usr/bin/env bash

# get file directory
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# update
sudo dnf update

# node/pnpm
sudo dnf install -y nodejs pnpm

# hyprland
sudo dnf install -y hyprland hyprlock

# toolbar
sudo dnf install -y waybar
sudo ln -s $/../configs/.config/waybar ~/.config/waybar

# Terminal
sudo dnf install -y alacritty
sudo ln -s $DIR/../configs/.config/alacritty ~/.config/alacritty

# zsh
sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting
sudo npm install --global pure-prompt
sudo usermod -s /usr/bin/zsh $(whoami)
sudo ln -s $DIR/../configs/.zshrc ~/.zshrc
sudo ln -s $DIR/../configs/.zprofile ~/.zprofile

# neofetch
sudo dnf install fastfetch
sudo ln -s $DIR/../configs/.config/fastfetch ~/.config/fastfetch

# wallpaper
sudo dnf install -y lz4 lz4-devel
if ! [[ -d ~/Repos ]]; then
  mkdir ~/Repos
fi
git clone https://github.com/LGFae/swww.git ~/Repos/swww
cargo build --release ~/Repos/swww
sudo cp ~/Repos/swww/target/release/swww /usr/bin/swww
sudo cp ~/Repos/swww/target/release/swww-daemon /usr/bin/swww-daemon