{ pkgs, ... }:

{
  systemd.user.services = {
    xgm-polkit = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
    xgm-skippy-xd = {
      description = "Task switcher for X11";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.skippy-xd}/bin/skippy-xd --start-daemon";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
    };
    xgm-tint2 = {
      description = "Taskbar for X11";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.tint2}/bin/tint2";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
    };
    xgm-nitrogen = {
      description = "Background browser and setter for X11";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.nitrogen}/bin/nitrogen --restore";
        RemainAfterExit = true;
        TimeoutStopSec = 10;
      };
    };
    xgm-conky = {
      description = "Conky system monitor";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.conky}/bin/conky";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
