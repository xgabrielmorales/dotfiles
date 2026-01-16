{ pkgs, mainUser, ... }:

{
  location = {
    provider = "manual";
    latitude = 4.66;
    longitude = -74.09;
  };
  services = {
    redshift.enable = true;
    syncthing = {
      enable = true;
      user = mainUser;
      dataDir = "/home/${mainUser}";
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm ];
      autoRepeatDelay = 200;
      autoRepeatInterval = 30;
      displayManager.lightdm.enable = true;
      windowManager.openbox.enable = true;
      xkb.variant = "intl";
      xkb.layout = "us";
    };
  };
}
