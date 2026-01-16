{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/bluetooth.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/development.nix
    ./modules/enviroment.nix
    ./modules/fonts.nix
    ./modules/home-manager
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/nvidia.nix
    ./modules/os.nix
    ./modules/packages.nix
    ./modules/users.nix
  ];
  system.stateVersion = "25.05";
}
