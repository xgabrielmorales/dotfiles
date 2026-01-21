{ pkgs, mainUser, ... }:

{
  # Deshabilitar Xorg
  services.xserver.enable = false;

  # Habilitar Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # greetd como display manager para Wayland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  # Servicios
  services.syncthing = {
    enable = true;
    user = mainUser;
    dataDir = "/home/${mainUser}";
  };

  # XDG portal para Wayland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
