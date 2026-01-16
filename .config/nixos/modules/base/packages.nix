{ pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;
  programs.zsh.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    cargo
    dig
    gcc
    git
    htop
    lm_sensors
    ncdu
    rustc
    unrar
    unzip
    vim
    wget
    zip
    zsh-completions
  ];
}
