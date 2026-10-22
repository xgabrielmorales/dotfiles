{ pkgs, ... }:

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
        exec_before = "${pkgs.libnotify}/bin/notify-send -u normal -i video-display 'Screen sharing' 'You started sharing your screen'";
        exec_after = "${pkgs.libnotify}/bin/notify-send -u normal -i video-display 'Screen sharing' 'You stopped sharing your screen'";
      };
    };
  };
}
