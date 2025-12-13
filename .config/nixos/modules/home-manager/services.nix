{ pkgs, ... }:

{
  systemd.user.services = {
    xgm-polkit = {
      Unit = {
        Description = "polkit-gnome-authentication-agent-1";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    xgm-skippy-xd = {
      Unit = {
        Description = "Task switcher for X11";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.skippy-xd}/bin/skippy-xd --start-daemon";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    xgm-tint2 = {
      Unit = {
        Description = "Taskbar for X11";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.tint2}/bin/tint2";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    xgm-nitrogen = {
      Unit = {
        Description = "Background browser and setter for X11";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.nitrogen}/bin/nitrogen --restore";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    xgm-conky = {
      Unit = {
        Description = "Conky system monitor";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.conky}/bin/conky";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

    xgm-xfce4-notifyd = {
      Unit = {
        Description = "Notification service";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart =
          "${pkgs.xfce.xfce4-notifyd}/lib/xfce4/notifyd/xfce4-notifyd";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };
  };
}
