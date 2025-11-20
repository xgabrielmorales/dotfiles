{ pkgs, zen-browser, ... }:

{
  # Packages
  nixpkgs.config.allowUnfreePredicate = pkg: true;

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

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # Add .local/bin to PATH for all users
  environment.localBinInPath = true;

  # Enable Nix flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
