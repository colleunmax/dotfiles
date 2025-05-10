dnf install -y hyprland waybar wofi alacritty flameshot wlogout lz4 lz4-devel scdoc

# zsh
dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s /usr/bin/zsh $SUDO_USER

# wlogout
ln -sf $DOTFILES_DIR/images/wlogout/* /usr/share/wlogout/icons

# swww
git clone https://github.com/LGFae/swww.git $DOTFILES_DIR/swww
cd $DOTFILES_DIR/swww
cargo build --release $SUDO_USER
./doc/gen.sh
cp ~/swww/doc/generated/* /usr/local/share/man/man1
cp ~/swww/target/release/swww /usr/bin/swww
cp ~/swww/target/release/swww-daemon /usr/bin/swww-daemon
chmod 711 /usr/bin/swww
chmod 711 /usr/bin/swww-daemon