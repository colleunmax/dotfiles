#!bin/dash

setopt PROMPT_SUBST

# Zsh-autosuggestions plugin
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Welcome banner
alias la="ls -la"
echo "* But nobody came.\n\n\n\n"

source "$HOME/.zsh/prompt.zsh"