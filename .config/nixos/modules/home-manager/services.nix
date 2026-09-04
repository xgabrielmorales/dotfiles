{ pkgs, ... }:

{
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
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
