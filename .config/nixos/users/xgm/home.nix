{ pkgs, mainUser, zen-browser, ... }:

let
  dotfiles = "/home/${mainUser}/dotfiles";
  bin = ".local/bin";
  share = ".local/share";
in {
  home.username = mainUser;
  home.homeDirectory = "/home/${mainUser}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Packages (from packages.nix)
  home.packages = with pkgs; [
    (rofi.override { plugins = [ rofi-calc rofi-emoji ]; })
    age
    alacritty
    arc-theme
    cameractrls-gtk4
    claude-code
    corepack_24
    csvlens
    diff-so-fancy
    eza
    fd
    firefox
    fzf
    gh
    git-extras
    grim
    gucharmap
    hunspell
    waypaper
    jetbrains.datagrip
    jq
    just
    lf
    libnotify
    mako
    neofetch
    neovim
    nodejs_24
    obs-studio
    pamixer
    papirus-icon-theme
    pavucontrol
    pipx
    postman
    python314
    ranger
    satty
    signal-desktop
    slurp
    sops
    spotify
    stow
    swaybg
    thunar
    tmux
    typora
    viewnior
    vlc
    waybar
    wireguard-tools
    wl-clipboard
    wlrctl
    xdg-user-dirs
    zathura
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    zsh
    zsh-completions
  ];

  # XDG config files
  xdg.configFile = {
    "alacritty".source = "${dotfiles}/.config/alacritty";
    "git".source = "${dotfiles}/.config/git";
    "gtk-2.0".source = "${dotfiles}/.config/gtk-2.0";
    "gtk-3.0".source = "${dotfiles}/.config/gtk-3.0";
    "gtk-4.0".source = "${dotfiles}/.config/gtk-4.0";
    "labwc".source = "${dotfiles}/.config/labwc";
    "lf".source = "${dotfiles}/.config/lf";
    "nvim".source = "${dotfiles}/.config/nvim";
    "ranger".source = "${dotfiles}/.config/ranger";
    "rofi".source = "${dotfiles}/.config/rofi";
    "shell".source = "${dotfiles}/.config/shell";
    "tmux".source = "${dotfiles}/.config/tmux";
    "waybar".source = "${dotfiles}/.config/waybar";
    "mako".source = "${dotfiles}/.config/mako";
    "xsettingsd".source = "${dotfiles}/.config/xsettingsd";
    "zathura".source = "${dotfiles}/.config/zathura";
    "zen".source = "${dotfiles}/.config/zen";
    "zsh".source = "${dotfiles}/.config/zsh";
  };

  # Home files
  home.file = {
    "${bin}/bookmarks".source = "${dotfiles}/${bin}/bookmarks";
    "${bin}/recycle".source = "${dotfiles}/${bin}/recycle";
    "${bin}/recycle-wayland".source = "${dotfiles}/${bin}/recycle-wayland";
    "${bin}/screenshot-wayland".source =
      "${dotfiles}/${bin}/screenshot-wayland";
    "${bin}/sink_module".source = "${dotfiles}/${bin}/sink_module";
    "${bin}/source_module".source = "${dotfiles}/${bin}/source_module";
    "${bin}/toggle-audio-output".source =
      "${dotfiles}/${bin}/toggle-audio-output";
    "${share}/applications".source = "${dotfiles}/${share}/applications";
    "${share}/fonts".source = "${dotfiles}/${share}/fonts";
    "${share}/themes".source = "${dotfiles}/${share}/themes";
  };

  xdg.desktopEntries = {
    "nvidia-settings" = {
      name = "";
      noDisplay = true;
    };
    "org.pwmt.zathura" = {
      name = "";
      noDisplay = true;
    };
    "thunar-bulk-rename" = {
      name = "";
      noDisplay = true;
    };
    "thunar-settings" = {
      name = "";
      noDisplay = true;
    };
    gvim = {
      name = "";
      noDisplay = true;
    };
    htop = {
      name = "";
      noDisplay = true;
    };
    lf = {
      name = "";
      noDisplay = true;
    };
    ranger = {
      name = "";
      noDisplay = true;
    };
    vim = {
      name = "";
      noDisplay = true;
    };
  };
}
