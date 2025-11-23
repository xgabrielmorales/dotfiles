{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/main-user
    ./modules/boot
    ./modules/networking
    ./modules/bluetooth
    ./modules/locale
    ./modules/desktop
    ./modules/packages
    ./modules/fonts
    ./modules/users
    ./modules/development
    ./modules/nvidia
    ./modules/polkit
  ];

  system.stateVersion = "25.05";
}
