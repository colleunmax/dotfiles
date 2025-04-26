# Fedora dev tools group install
dnf group install development-tools -y

# Nodejs
dnf install -y nodejs pnpm yarn

# Python
dnf install -y python3

# Rust
su -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" $SUDO_USER
su -c "rustup update" $SUDO_USER