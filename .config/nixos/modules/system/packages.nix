{ pkgs, lib, spotatui, ... }:

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
      spotatui.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
