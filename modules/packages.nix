{ pkgs, ... }:

{
  # Packages
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  environment.systemPackages = with pkgs; [
    cargo
    gcc
    git
    htop
    lm_sensors
    python314
    rustc
    unzip
    vim
    wget
    zip
    dig
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;

  # Enable Nix flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
