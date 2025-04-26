#!/bin/bash
ln -sf $DOTFILES_DIR/configs/.config/* ~/.config
ln -sf $DOTFILES_DIR/configs/.config/.* ~/.config
ln -sf $DOTFILES_DIR/configs/home/* ~/
ln -sf $DOTFILES_DIR/configs/home/.* ~/

# SWWW Scripts
ln -sf $DOTFILES_DIR/scripts/swww/* /usr/bin

# Flameshot Script
ln -sf $DOTFILES_DIR/scripts/screenshot.sh

# Fonts
mkdir -p ~/.local/share/fonts
ln -df $DOTFILES_DIR/fonts/* ~/.local/share/fonts