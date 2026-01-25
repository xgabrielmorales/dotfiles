{ pkgs, mainUser, zen-browser, ... }:

{
  # Configuración de usuario (de users.nix)
  security.sudo = {
    configFile = ''
      # Disable sudo timeout (ask for password every time)
      Defaults timestamp_timeout=0
    '';
  };

  users = {
    mutableUsers = false;
    groups = {
      ${mainUser} = {
        name = mainUser;
        gid = 1000;
      };
    };
    users = {
      root = {
        hashedPassword =
          "$6$LFjitH4qaP2ZlWvx$2tiE98H92SGMkM3g9lHHZIBsv3h56evEgcnl9RaGbwJUmqYG7nrQKyCl9iOnLYCb5xWIgD8Vbw/Sk2vI75xSn.";
      };
      ${mainUser} = {
        isNormalUser = true;
        home = "/home/${mainUser}";
        uid = 1000;
        group = mainUser;
        extraGroups = [ "wheel" ];
        hashedPassword =
          "$6$NrF8dQmb8fp6DBZy$Zgb.IEodEdox3nIyxdCjr6bbgm3J6tCP5nwjXN.qDsYyyzsfNOnNpPqqDlAKoClHHN8A5fISaICfrCEdd.Kcr0";
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
      };
    };
  };

  # Configuración home-manager (de home-manager/default.nix)
  home-manager.users.${mainUser} = import ./home.nix;
  home-manager.extraSpecialArgs = { inherit mainUser zen-browser; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
