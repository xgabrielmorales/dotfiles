{ pkgs, mainUser, ... }:

{
  location = {
    provider = "manual";
    latitude = 4.66;
    longitude = -74.09;
  };
  services = {
    syncthing = {
      enable = true;
      user = mainUser;
      dataDir = "/home/${mainUser}";
    };
    getty = {
      autologinUser = mainUser;
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
    redshift.enable = true;
  };
}
