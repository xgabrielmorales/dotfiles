{ config, pkgs, ... }:

{
  services = {
    syncthing = {
      enable = true;
      user = config.mainUser;
      dataDir = "/home/${config.mainUser}";
    };
    getty = {
      autologinUser = config.mainUser;
      autologinOnce = true;
      greetingLine = "";
      helpLine = "";
    };
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 30;
      autorun = false;
      displayManager.startx.enable = true;
      enable = true;
      windowManager.openbox.enable = true;
      xkb = {
        variant = "intl";
        layout = "us";
      };
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ config.mainUser ];
      };
    };
  };

  # Systemd services
  systemd.packages = with pkgs.xfce; [ xfce4-notifyd ];
}
