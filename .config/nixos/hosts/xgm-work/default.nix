{ ... }:

{
  imports = [
    ../../modules/common.nix

    # Host
    ./hardware-configuration.nix
    ./keyboard.nix
    ./laptop.nix
    ./luks.nix
    ./networking.nix
    ./nvidia.nix

    # Services
    ../../modules/services/wireguard.nix

    # Hardware support
    ../../modules/hardware/iphone-tethering.nix
  ];

  system.stateVersion = "25.05";
}
