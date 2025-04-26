# hyprland
sudo dnf install -y hyprland hyprlock
sudo ln -s $DIR/../configs/.config/hypr ~/.config/hypr

# toolbar
sudo dnf install -y waybar
sudo ln -s $DIR/../configs/.config/waybar ~/.config/waybar

# Application finder
sudo dnf install -y wofi
sudo ln -s $DIR/../configs/.config/wofi ~/.config/wofi

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
sudo dnf install -y fastfetch
sudo ln -s $DIR/../configs/.config/fastfetch ~/.config/fastfetch

# wallpaper
sudo dnf install -y lz4 lz4-devel
if ! [[ -d ~/Repos ]]; then
  mkdir ~/Repos
fi
git clone https://github.com/LGFae/swww.git ~/Repos/swww
cd ~/Repos/swww
cargo build --release
cd $DIR
sudo cp ~/Repos/swww/target/release/swww /usr/bin/swww
sudo cp ~/Repos/swww/target/release/swww-daemon /usr/bin/swww-daemon
sudo ln -s $DIR/wallpaper-switch.sh /usr/bin/wallpaper-switch
wallpapers=$(ls "$DIR/../wallpapers")
echo ${wallpapers[0]} >> $DIR/../scripts/wallpaper.cache.txt