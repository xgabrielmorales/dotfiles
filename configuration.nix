{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/bluetooth.nix
    ./modules/locale.nix
    ./modules/desktop.nix
    ./modules/packages.nix
    ./modules/fonts.nix
    ./modules/users.nix
    ./modules/development.nix
    ./modules/nvidia.nix
  ];

  system.stateVersion = "25.05";
}
