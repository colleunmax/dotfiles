#!/usr/bin/env bash

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function fn_main() {
    source $DOTFILES_DIR/scripts/setup/update.sh
    echo "Installing you dotfiles"

    source $DOTFILES_DIR/scripts/setup/dnf-setup.sh
    source $DOTFILES_DIR/scripts/setup/symlink-dotfiles.sh
    source $DOTFILES_DIR/scripts/setup/git-setup.sh
    source $DOTFILES_DIR/scripts/setup/programming-tools.sh
    source $DOTFILES_DIR/scripts/setup/fun-stuff.sh
    source $DOTFILES_DIR/scripts/setup/management.sh
    source $DOTFILES_DIR/scripts/setup/browsers.sh
    source $DOTFILES_DIR/scripts/setup/system-app.sh
}


if [ $EUID -eq "0" ]; then
    # fn_update_deps
    fn_main
else
    exec sudo bash "$0" "$@"
fi