{ pkgs, ... }:

{
  services = {
    # Enable the X11 windowing system.
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 30;
      autorun = false;
      displayManager.startx.enable = true;
      enable = true;
      videoDrivers = [ "nvidia" ];
      windowManager.openbox.enable = true;
      xkb = {
        variant = "intl";
        layout = "us";
      };
    };
    blueman.enable = true;
  };

  # Systemd services
  systemd.packages = with pkgs.xfce; [ xfce4-notifyd ];
}
