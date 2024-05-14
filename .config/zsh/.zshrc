set -o emacs

autoload -Uz compinit; compinit

# The order matters
source "$XDG_CONFIG_HOME/shell/prompt"
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/profile"
source "$XDG_CONFIG_HOME/shell/plugins"
