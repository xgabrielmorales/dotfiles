{ ... }:

{
  imports = [
    ../../modules/common.nix

    # Host
    ./hardware-configuration.nix
    ./keyboard.nix
    ./luks.nix
    ./networking.nix
    ./nvidia.nix

    # Hardware support
    ../../modules/hardware/laptop.nix
    ../../modules/hardware/iphone-tethering.nix
  ];

  system.stateVersion = "25.05";
}
