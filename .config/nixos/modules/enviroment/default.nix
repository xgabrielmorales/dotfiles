{ ... }:

{
  environment.sessionVariables = rec {
    # XDG Base Directory specification
    # https://wiki.archlinux.org/title/XDG_Base_Directory
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    ANSIBLE_CONFIG = "${XDG_CONFIG_HOME}/ansible.cfg";
    ANSIBLE_GALAXY_CACHE_DIR = "${XDG_CACHE_HOME}/ansible/galaxy_cache";
    ANSIBLE_HOME = "${XDG_CONFIG_HOME}/ansible";
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";
    GTK2_RC_FILES = "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc";
    KUBECACHEDIR = "${XDG_CACHE_HOME}/kube";
    KUBECONFIG = "${XDG_CONFIG_HOME}/kube";
    MINIKUBE_HOME = "${XDG_DATA_HOME}/minikube";
    NPM_CONFIG_CACHE = "${XDG_CACHE_HOME}/npm";
    NPM_CONFIG_INIT_MODULE = "${XDG_CONFIG_HOME}/npm/config/npm-init.js";
    NPM_CONFIG_PREFIX = "$HOME/.local";
    NPM_CONFIG_USERCONFIG = "${XDG_CONFIG_HOME}/npm/npmrc";
    PYTHONPYCACHEPREFIX = "${XDG_CACHE_HOME}/python";
    PYTHON_HISTORY = "${XDG_DATA_HOME}/python_history";
    RUFF_CACHE_DIR = "${XDG_CACHE_HOME}/ruff";
    WGETRC = "${XDG_CONFIG_HOME}/wget/wgetrc";
    XINITRC = "${XDG_CONFIG_HOME}/X11/xinitrc";
    XSERVERRC = "${XDG_CONFIG_HOME}/X11/xserverrc";
    ZDOTDIR = "${XDG_CONFIG_HOME}/zsh";
  };
}
