# XDG Base Directory specification
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHON_HISTORY="$XDG_DATA_HOME/python_history"
export RUFF_CACHE_DIR="$XDG_CACHE_HOME/ruff"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
