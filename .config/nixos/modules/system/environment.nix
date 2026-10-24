{ pkgs, ... }:

{
  environment.pathsToLink = [
    "/share/zsh"
    "/share/fzf-tab"
  ];
  environment.sessionVariables = rec {
    # SVG gdk-pixbuf loader, so GTK apps can render SVG icons from Papirus.
    GDK_PIXBUF_MODULE_FILE = "${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache";

    # XDG Base Directory specification
    # https://wiki.archlinux.org/title/XDG_Base_Directory
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Wayland
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";

    ANDROID_USER_HOME = "${XDG_DATA_HOME}/android";
    ANSIBLE_CONFIG = "${XDG_CONFIG_HOME}/ansible.cfg";
    ANSIBLE_GALAXY_CACHE_DIR = "${XDG_CACHE_HOME}/ansible/galaxy_cache";
    ANSIBLE_HOME = "${XDG_CONFIG_HOME}/ansible";
    AWS_CONFIG_FILE = "${XDG_CONFIG_HOME}/aws/config";
    AWS_SHARED_CREDENTIALS_FILE = "${XDG_CONFIG_HOME}/aws/credentials";
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    CHECKPOINT_DISABLE = "1"; # terraform: stops ~/.terraform.d/checkpoint_*
    CLAUDE_CONFIG_DIR = "${XDG_CONFIG_HOME}/claude-code";
    CLOUDSDK_CONFIG = "${XDG_CONFIG_HOME}/gcloud";
    CUDA_CACHE_PATH = "${XDG_CACHE_HOME}/nv";
    DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";
    GNUPGHOME = "${XDG_DATA_HOME}/gnupg";
    GTK2_RC_FILES = "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc";
    INPUTRC = "${XDG_CONFIG_HOME}/readline/inputrc";
    KUBECACHEDIR = "${XDG_CACHE_HOME}/kube";
    KUBECONFIG = "${XDG_CONFIG_HOME}/kube/config";
    LESSHISTFILE = "${XDG_STATE_HOME}/less/history";
    NODE_REPL_HISTORY = "${XDG_STATE_HOME}/node_repl_history";
    NPM_CONFIG_CACHE = "${XDG_CACHE_HOME}/npm";
    NPM_CONFIG_INIT_MODULE = "${XDG_CONFIG_HOME}/npm/config/npm-init.js";
    NPM_CONFIG_PREFIX = "$HOME/.local";
    NPM_CONFIG_USERCONFIG = "${XDG_CONFIG_HOME}/npm/npmrc";
    PYTHONPYCACHEPREFIX = "${XDG_CACHE_HOME}/python";
    PYTHON_HISTORY = "${XDG_DATA_HOME}/python_history";
    RUFF_CACHE_DIR = "${XDG_CACHE_HOME}/ruff";
    SONAR_USER_HOME = "${XDG_DATA_HOME}/sonar";
    TF_CLI_CONFIG_FILE = "${XDG_CONFIG_HOME}/terraform/terraformrc";
    WGETRC = "${XDG_CONFIG_HOME}/wget/wgetrc";
    ZDOTDIR = "${XDG_CONFIG_HOME}/zsh";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java";
  };
}
