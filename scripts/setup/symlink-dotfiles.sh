#!/bin/bash

chmod +x $DOTFILES_DIR/scripts/*

su -c "ln -sf $DOTFILES_DIR/configs/.config/* ~/.config" $SUDO_USER
su -c "ln -sf $DOTFILES_DIR/configs/home/.* ~/" $SUDO_USER

# SWWW Scripts
ln -sf $DOTFILES_DIR/scripts/swww/change_wallpaper.sh /usr/bin/change_wallpaper
ln -sf $DOTFILES_DIR/scripts/swww/setup_wallpaper.sh /usr/bin/setup_wallpapers

# Flameshot Script
ln -sf $DOTFILES_DIR/scripts/screenshot.sh /usr/bin/screenshot

# Fonts
su -c "mkdir -p ~/.fonts" $SUDO_USER
su -c "ln -sf $DOTFILES_DIR/fonts/* ~/.fonts" $SUDO_USER
su -c "fc-cache -f"