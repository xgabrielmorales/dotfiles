{ pkgs, ... }:

{
  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;
  programs.zsh.enable = true;
  programs.zsh.enableGlobalCompInit = false;

  # System Packages
  environment.systemPackages = with pkgs; [
    cargo
    dig
    gcc
    git
    htop
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
    zsh-completions
  ];
}
