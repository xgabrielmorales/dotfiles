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
    ../../modules/hardware/webcam.nix

    # Services
    ../../modules/services/virtualbox.nix
    ../../modules/services/wireguard.nix
    ../../modules/services/steam.nix
  ];

  # Hibernation target (~RAM size)
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  system.stateVersion = "25.05";
}
