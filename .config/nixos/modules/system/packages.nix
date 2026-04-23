{ pkgs, lib, ... }:

{
  programs = {
    direnv.enable = true;
    nano.enable = false;
  };

  documentation.nixos.enable = false;

  environment = {
    localBinInPath = true;
    defaultPackages = lib.mkForce [ ];
    systemPackages = with pkgs; [
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
  };
}
