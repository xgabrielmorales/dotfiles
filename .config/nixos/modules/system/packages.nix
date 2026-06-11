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
      git
      vim
      zsh
      htop
    ];
  };
}
