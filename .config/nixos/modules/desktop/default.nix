{ config, pkgs, ... }:

{
  location = {
    provider = "manual";
    latitude = 4.66;
    longitude = -74.09;
  };
  services = {
    gnome.gnome-keyring.enable = true;
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
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 30;
      displayManager = {
        lightdm.enable = true;
        sessionCommands = ''
          ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
            Xcursor.theme: Adwaita
            Xcursor.size: 32
          EOF
        '';
      };
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
    redshift.enable = true;
  };

  # Systemd services
  systemd.packages = with pkgs.xfce; [ xfce4-notifyd ];
}
