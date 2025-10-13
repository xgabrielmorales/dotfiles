{ config, lib, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "xgm";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  console = {
    enable = true;
    useXkbConfig = true;
  };

  # Enable the X11 windowing system.
  services.xserver = {
    autoRepeatDelay = 200;
    autoRepeatInterval = 30;
    autorun = false;
    displayManager.startx.enable = true;
    enable = true;
    windowManager.openbox.enable = true;
    xkb = {
      variant = "intl";
      layout = "us";
    };
  };

  # Packages
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  environment.systemPackages = with pkgs; [
    cargo
    gcc
    git
    htop
    python314
    rustc
    unzip
    vim
    wget
    zip
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;
  users.users = {
    xgm = {
      isNormalUser = true;
      description = "Gabriel Morales";
      home = "/home/xgm";
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        alacritty
        arc-theme
        blueman
        bluez
        cameractrls-gtk4
        claude-code
        diff-so-fancy
        discord
        docker-buildx
        docker-compose
        docker_28
        eza
        fd
        fzf
        git-extras
        gucharmap
        hunspell
        lf
        libnotify
        maim
        neofetch
        neovim
        nitrogen
        nodejs_24
        pamixer
        pavucontrol
        ranger
        redshift
        ripgrep
        rofi
        rofi-calc
        rofi-emoji
        satty
        simplescreenrecorder
        skippy-xd
        stow
        syncthing
        tmux
        typora
        viewnior
        vlc
        wireguard-tools
        wmctrl
        xclip
        xdotool
        xfce.thunar
        xorg.xev
        zathura
      ];
    };
  };

  fonts.packages = with pkgs; [
    cantarell-fonts
    icomoon-feather
    nerd-fonts.jetbrains-mono
    papirus-icon-theme
    twitter-color-emoji
  ];

  # Systemd services
  systemd.packages = with pkgs.xfce; [ xfce4-notifyd ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
