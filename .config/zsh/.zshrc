set -o emacs

autoload -Uz compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# THE ORDER MATTERS!
source "$XDG_CONFIG_HOME/zsh/prompt"
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/profile"
source "$XDG_CONFIG_HOME/zsh/plugins"
