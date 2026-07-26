{ pkgs, config, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = "4.69";
    longitude = "-74.1";
  };

  systemd.user.services.xremap = {
    Unit = {
      Description = "xremap - foot pedal push-to-talk (mic gate)";
      After = [
        "graphical-session.target"
        "pipewire.service"
      ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = ''${pkgs.xremap}/bin/xremap --device "PCsensor FootSwitch Keyboard" --watch=device --allow-launch true ${config.xdg.configHome}/xremap/config.yml'';
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
