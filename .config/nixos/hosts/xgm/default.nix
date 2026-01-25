{ ... }:

{
  imports = [
    # Hardware de este host
    /etc/nixos/hardware-configuration.nix
    ./networking.nix

    # Core system
    ../../modules/core/boot.nix
    ../../modules/core/locale.nix
    ../../modules/core/nix.nix
    ../../modules/core/security.nix

    # System settings
    ../../modules/system/environment.nix
    ../../modules/system/fonts.nix
    ../../modules/system/packages.nix

    # Hardware support
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/nvidia.nix

    # Desktop environment
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/greetd.nix
    ../../modules/desktop/xdg.nix
    ../../modules/desktop/steam.nix

    # Services
    ../../modules/services/docker.nix
    ../../modules/services/ssh.nix
    ../../modules/services/syncthing.nix

    # Users
    ../../users/xgm
  ];

  system.stateVersion = "25.05";
}
