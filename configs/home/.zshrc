#!bin/dash
# .zshrc
autoload -U promptinit; promptinit

prompt pure

# chaning default colors
zmodload zsh/nearcolor
zstyle ':prompt:pure:prompt:continuation' color "#B9FFA8"
zstyle ':prompt:pure:prompt:success' color "#CACACA"
zstyle ':prompt:pure:prompt:error' color "#FFB7A8"
zstyle ':prompt:pure:git:*' color "#D1FFF9"
zstyle ':prompt:pure:execution_t' color "#CACACA"
zstyle ':prompt:pure:virtualenv' color "#CACACA"
zstyle ':prompt:pure:path' color "#CACACA"
zstyle ':prompt:pure:prompt' color "#D1FFF9"

# Zsh-autosuggestions plugin
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Welcome banner
alias la="ls -la"
echo "======================================================================="
echo "                         Welcome Home, $(whoami)"
echo "======================================================================="