{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/base/boot.nix
    ./modules/base/fonts.nix
    ./modules/base/locale.nix
    ./modules/base/nix.nix
    ./modules/base/packages.nix
    ./modules/base/security.nix
    ./modules/desktop.nix
    ./modules/development.nix
    ./modules/enviroment.nix
    ./modules/home-manager
    ./modules/networking.nix
    ./modules/nvidia.nix
    ./modules/peripherals.nix
    ./modules/users.nix
  ];
  system.stateVersion = "25.05";
}
