{ ... }:

{
  imports = [
    ../../modules/common.nix

    # Host
    ./hardware-configuration.nix
    ./keyboard.nix
    ./networking.nix
    ./nvidia.nix

    # Hardware support
    ../../modules/hardware/footpedal.nix
    ../../modules/hardware/webcam.nix

    # Services
    ../../modules/services/virtualbox.nix
  ];

  system.stateVersion = "25.05";
}
