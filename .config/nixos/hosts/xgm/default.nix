{ ... }:

{
  imports = [
    # Host
    /etc/nixos/hardware-configuration.nix
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
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/footpedal.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/webcam.nix

    # Desktop environment
    ../../modules/desktop/labwc.nix
    ../../modules/desktop/greetd.nix
    ../../modules/desktop/xdg.nix

    # Services
    ../../modules/services/docker.nix
    ../../modules/services/ssh.nix
    ../../modules/services/syncthing.nix
    ../../modules/services/virtualbox.nix

    # Home Manager
    ../../modules/home-manager/home.nix
  ];

  # Keyboard
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "intl";
  };

  system.stateVersion = "25.05";
}
