set -o emacs

# Optimized compinit - cache for 24 hours
autoload -Uz compinit

setopt EXTENDEDGLOB

for dump in ${ZDOTDIR:-$HOME}/.zcompdump(#qNmh-24); do
  compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
done

if [[ ! -e ${ZDOTDIR:-$HOME}/.zcompdump ]]; then
  compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
else
  compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump"
fi

unsetopt EXTENDEDGLOB

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# THE ORDER MATTERS!
source "$XDG_CONFIG_HOME/zsh/prompt"
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/profile"
source "$XDG_CONFIG_HOME/zsh/plugins"
