{ pkgs, ... }:

let
  lock = "${pkgs.waylock}/bin/waylock -fork-on-lock -init-color 0x1e222a -input-color 0x98c379 -fail-color 0xe06c75";
  turn_screen_off = "${pkgs.wlopm}/bin/wlopm --off '*'";
  turn_screen_on = "${pkgs.wlopm}/bin/wlopm --on '*'";
  suspend = "${pkgs.systemd}/bin/systemctl suspend";
in
{
  services = {
    wob.enable = true;
    poweralertd.enable = true;
    swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 300; # 5 min
          command = lock;
        }
        {
          timeout = 300; # 5 min
          command = turn_screen_off;
          resumeCommand = turn_screen_on;
        }
        {
          timeout = 900; # 15 min
          command = suspend;
        }
      ];
      events.before-sleep = lock;
      events.lock = lock;
    };
  };

  systemd.user.services.ironbar = {
    Unit = {
      Description = "ironbar - barra de estado";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Environment = [ "GSK_RENDERER=gl" ];
      ExecStart = "${pkgs.ironbar}/bin/ironbar";
      Restart = "always";
      RestartSec = 1;
      KillMode = "process";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
