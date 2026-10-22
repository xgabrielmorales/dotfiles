{ pkgs, ... }:

let
  lock = "${pkgs.waylock}/bin/waylock -fork-on-lock -init-color 0x1e222a -input-color 0x98c379 -fail-color 0xe06c75";
  wlopm = "${pkgs.wlopm}/bin/wlopm";
in
{
  services.wob.enable = true;

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 120;
        command = "${wlopm} --off '*'";
        resumeCommand = "${wlopm} --on '*'";
      }
      {
        timeout = 300;
        command = lock;
      }
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events.before-sleep = lock;
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
