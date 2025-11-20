{ pkgs, ... }:

{
  security.sudo = {
    configFile = ''
      # Disable sudo timeout (ask for password every time)
      Defaults timestamp_timeout=0
    '';
  };

  users = {
    mutableUsers = false;
    groups = {
      xgm = {
        name = "xgm";
        gid = 1000;
      };
    };
    users = {
      root = {
        hashedPassword =
          "$6$LFjitH4qaP2ZlWvx$2tiE98H92SGMkM3g9lHHZIBsv3h56evEgcnl9RaGbwJUmqYG7nrQKyCl9iOnLYCb5xWIgD8Vbw/Sk2vI75xSn.";
      };
      xgm = {
        isNormalUser = true;
        description = "Gabriel Morales";
        home = "/home/xgm";
        uid = 1000;
        group = "xgm";
        extraGroups = [ "wheel" ];
        hashedPassword =
          "$6$NrF8dQmb8fp6DBZy$Zgb.IEodEdox3nIyxdCjr6bbgm3J6tCP5nwjXN.qDsYyyzsfNOnNpPqqDlAKoClHHN8A5fISaICfrCEdd.Kcr0";
        shell = pkgs.zsh;
      };
    };
  };
}
