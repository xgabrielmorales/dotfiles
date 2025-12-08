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
    ./modules/locale
    ./modules/main-user
    ./modules/networking
    ./modules/nvidia
    ./modules/os
    ./modules/packages
    ./modules/systemd
    ./modules/users
  ];
  system.stateVersion = "25.05";
}
