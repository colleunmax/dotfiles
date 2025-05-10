dnf install -y hyprland hyprland-devel waybar wofi alacritty flameshot wlogout lz4 lz4-devel scdoc

# zsh
dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s /usr/bin/zsh $SUDO_USER

# wlogout
ln -sf $DOTFILES_DIR/images/wlogout/* /usr/share/wlogout/icons

# swww
git clone https://github.com/LGFae/swww.git $DOTFILES_DIR/swww
cd $DOTFILES_DIR/swww
cargo build --release
./doc/gen.sh
cp $DOTFILES_DIR/swww/doc/generated/* /usr/local/share/man/man1
cp $DOTFILES_DIR/swww/target/release/swww /usr/bin/swww
cp $DOTFILES_DIR/swww/target/release/swww-daemon /usr/bin/swww-daemon
chmod 711 /usr/bin/swww
chmod 711 /usr/bin/swww-daemon