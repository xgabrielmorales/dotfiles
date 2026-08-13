{ pkgs, ... }:

{
  time = {
    timeZone = "America/Bogota";
    hardwareClockInLocalTime = true;
  };
  console = {
    enable = true;
    useXkbConfig = true;
    font = "ter-v24n";
    packages = [ pkgs.terminus_font ];
  };
}
