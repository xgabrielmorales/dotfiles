{ pkgs, mainUser, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.labwc = {
      default = "wlr;*";
      "org.freedesktop.impl.portal.Inhibit" = "none";
    };
    wlr = {
      enable = true;
      settings.screencast = {
        chooser_type = "none";
        max_fps = 30;
        exec_before = "/home/${mainUser}/.local/bin/screenshare-hook start";
        exec_after = "/home/${mainUser}/.local/bin/screenshare-hook stop";
      };
    };
  };
}
