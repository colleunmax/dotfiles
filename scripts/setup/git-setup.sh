dnf install -y git

if gum confirm "Would you like to update your Git username and email?"; then
  IS_RUNNING=true
  while $IS_RUNNING; do
    GIT_USERNAME=$(gum input --placeholder "Enter your Git username")
    GIT_EMAIL=$(gum input --placeholder "Enter your Git email")

    if gum confirm "Are these correct? Username: $GIT_USERNAME, Email: $GIT_EMAIL"; then
      IS_RUNNING=false
    fi
  done
  su -c "git config --global user.name "$GIT_USERNAME"" $SUDO_USER
  su -c "git config --global user.email "$GIT_EMAIL"" $SUDO_USER
fi