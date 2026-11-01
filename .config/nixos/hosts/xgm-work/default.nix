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
    ./yubikey.nix

    # Services
    ../../modules/services/wireguard.nix

    # Hardware support
    ../../modules/hardware/iphone-tethering.nix
  ];

  # Hibernation target (~RAM size)
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 40 * 1024;
    }
  ];

  system.stateVersion = "25.05";
}
