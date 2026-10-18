bindkey -e

fpath=(/etc/profiles/per-user/$USER/share/zsh/site-functions /run/current-system/sw/share/zsh/site-functions $fpath)

# Optimized compinit - cache for 24 hours
autoload -Uz compinit

setopt EXTENDEDGLOB

if [[ -n $XDG_CACHE_HOME/.zcompdump(#qNmh-24) ]]; then
  compinit -C -d "$XDG_CACHE_HOME/.zcompdump"
else
  compinit -d "$XDG_CACHE_HOME/.zcompdump"
  touch "$XDG_CACHE_HOME/.zcompdump"
  zcompile -R "$XDG_CACHE_HOME/.zcompdump"
fi

unsetopt EXTENDEDGLOB

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 -F --all --group-directories-first --icons $realpath'

_fzf_excludes=(--exclude .git --exclude node_modules --exclude .venv --exclude target)
export FZF_DEFAULT_COMMAND="fd --hidden --follow ${_fzf_excludes[*]}"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow ${_fzf_excludes[*]}"
_fzf_compgen_path() { fd --hidden --follow $_fzf_excludes . "$1" }
_fzf_compgen_dir()  { fd --type d --hidden --follow $_fzf_excludes . "$1" }

# THE ORDER MATTERS!
source <(fzf --zsh)
source "$XDG_CONFIG_HOME/zsh/prompt"
source "$XDG_CONFIG_HOME/zsh/aliases"
source "$XDG_CONFIG_HOME/zsh/profile"
source "$XDG_CONFIG_HOME/zsh/plugins"

eval "$(direnv hook zsh)"
