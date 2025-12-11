{ config, pkgs, zen-browser, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # System Pacakges
  environment.systemPackages = with pkgs; [
    cargo
    dig
    gcc
    htop
    just
    lm_sensors
    rustc
    unzip
    vim
    wget
    zip
  ];

  # User Pacakges
  users.users.${config.mainUser}.packages = with pkgs; [
    alacritty
    arc-theme
    cameractrls-gtk4
    conky
    csvlens
    eza
    fzf
    gucharmap
    jq
    lf
    libnotify
    lxappearance
    maim
    ncdu
    neofetch
    nitrogen
    pamixer
    papirus-icon-theme
    pavucontrol
    ranger
    (rofi.override { plugins = [ rofi-calc rofi-emoji ]; })
    satty
    simplescreenrecorder
    skippy-xd
    spotify
    stow
    tint2
    tmux
    typora
    viewnior
    vlc
    wmctrl
    xclip
    xdg-user-dirs
    xdotool
    xfce.thunar
    xfce.xfce4-notifyd
    xorg.xev
    zathura
    zen-browser.packages.${pkgs.system}.default
    zsh-completions
  ];
}
