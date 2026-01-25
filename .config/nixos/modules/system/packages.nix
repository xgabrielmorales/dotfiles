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
    gnumake
    htop
    lm_sensors
    ncdu
    pciutils
    ripgrep
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
