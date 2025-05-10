#!/bin/bash

chmod 775 -R $DOTFILES_DIR/scripts

su -c "ln -sf $DOTFILES_DIR/configs/.config/* ~/.config" $SUDO_USER
su -c "ln -sf $DOTFILES_DIR/configs/home/.* ~/" $SUDO_USER

# SWWW Scripts
ln -sf $DOTFILES_DIR/scripts/swww/change_wallpaper.sh /usr/bin/change_wallpaper
ln -sf $DOTFILES_DIR/scripts/swww/setup_wallpapers.sh /usr/bin/setup_wallpapers
su -c "sh /usr/bin/setup_wallpapers" $SUDO_USER

# Flameshot Script
ln -sf $DOTFILES_DIR/scripts/screenshot.sh /usr/bin/screenshot

# Fonts
su -c "mkdir -p ~/.fonts" $SUDO_USER
su -c "ln -sf $DOTFILES_DIR/fonts/* ~/.fonts" $SUDO_USER
su -c "fc-cache -f"