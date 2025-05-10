# Fedora dev tools group install
dnf group install development-tools -y

# Nodejs
dnf install -y nodejs pnpm yarn

# Python
dnf install -y python3

# Rust
dnf install rust cargo -y