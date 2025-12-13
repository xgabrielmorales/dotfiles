{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/bluetooth
    ./modules/boot
    ./modules/desktop
    ./modules/development
    ./modules/enviroment
    ./modules/fonts
    ./modules/home-manager
    ./modules/locale
    ./modules/networking
    ./modules/nvidia
    ./modules/os
    ./modules/packages
    ./modules/users
  ];
  system.stateVersion = "25.05";
}
