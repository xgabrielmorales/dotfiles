{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/desktop.nix
    ./modules/packages.nix
    ./modules/fonts.nix
    ./modules/users.nix
    ./modules/virtualization.nix
  ];

  system.stateVersion = "25.05";
}
