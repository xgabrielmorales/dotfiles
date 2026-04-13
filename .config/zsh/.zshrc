set -o emacs

# Optimized compinit - cache for 24 hours
autoload -Uz compinit

setopt EXTENDEDGLOB

if [[ -n $XDG_CACHE_HOME/.zcompdump(#qNmh-24) ]]; then
  compinit -C -d "$XDG_CACHE_HOME/.zcompdump"
else
  compinit -d "$XDG_CACHE_HOME/.zcompdump"
fi

unsetopt EXTENDEDGLOB

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 -F --all --group-directories-first --icons $realpath'

# THE ORDER MATTERS!
source <(fzf --zsh)
source "$XDG_CONFIG_HOME/zsh/prompt"
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/profile"
source "$XDG_CONFIG_HOME/zsh/plugins"

eval "$(direnv hook zsh)"
