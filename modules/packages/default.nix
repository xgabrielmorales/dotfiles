{ config, pkgs, zen-browser, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # System Pacakges
  environment.systemPackages = with pkgs; [
    cargo
    gcc
    htop
    lm_sensors
    rustc
    unzip
    vim
    wget
    zip
    dig
    zen-browser.packages.${pkgs.system}.default
  ];

  # User Pacakges
  users.users.${config.mainUser}.packages = with pkgs; [
    alacritty
    arc-theme
    cameractrls-gtk4
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
    redshift
    rofi
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
    xorg.xev
    zathura
    zsh-completions
  ];
}
