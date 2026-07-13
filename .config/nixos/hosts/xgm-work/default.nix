{ ... }:

{
  imports = [
    # Host
    ./hardware-configuration.nix
    ./networking.nix

    # Core system
    ../../modules/core/boot.nix
    ../../modules/core/locale.nix
    ../../modules/core/nix.nix
    ../../modules/core/security.nix
    ../../modules/core/sops.nix

    # System settings
    ../../modules/system/environment.nix
    ../../modules/system/fonts.nix
    ../../modules/system/packages.nix
    ../../modules/system/users.nix

    # Hardware support
    ../../modules/hardware/audio.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/laptop.nix
    ../../modules/hardware/iphone-tethering.nix

    # Desktop environment
    ../../modules/desktop/labwc.nix
    ../../modules/desktop/greetd.nix
    ../../modules/desktop/xdg.nix

    # Services
    ../../modules/services/docker.nix
    ../../modules/services/kubernetes.nix
    ../../modules/services/ssh.nix

    # Home Manager
    ../../modules/home-manager/home.nix
  ];

  # Keyboard
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "latam";
  };

  system.stateVersion = "25.05";
}
