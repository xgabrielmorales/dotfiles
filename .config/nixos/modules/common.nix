{ ... }:

{
  imports = [
    # Core system
    ./core/boot.nix
    ./core/locale.nix
    ./core/nix.nix
    ./core/security.nix
    ./core/sops.nix

    # System settings
    ./system/environment.nix
    ./system/fonts.nix
    ./system/packages.nix
    ./system/users.nix

    # Hardware support
    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./hardware/nvidia.nix

    # Desktop environment
    ./desktop/labwc.nix
    ./desktop/greetd.nix
    ./desktop/xdg.nix

    # Services
    ./services/docker.nix
    ./services/kubernetes.nix
    ./services/ssh.nix

    # Home Manager
    ./home-manager/home.nix
  ];
}
