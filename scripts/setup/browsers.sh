dnf remove -y firefox

# Chromium
dnf install -y chromium

# Librewolf
curl -fsSL https://repo.librewolf.net/librewolf.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
dnf install -y librewolf

# Epiphany
dnf install -y epiphany