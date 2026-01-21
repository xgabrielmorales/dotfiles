{ pkgs, ... }:

{
  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    cargo
    dig
    gcc
    git
    htop
    hyprpaper
    lm_sensors
    ncdu
    pciutils
    rustc
    unrar
    unzip
    usbutils
    vim
    wget
    zip
    zsh
  ];
}
