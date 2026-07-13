{
  config,
  mainUser,
  pkgs,
  ...
}:

{
  sops.secrets."users/${mainUser}/password".neededForUsers = true;
  sops.secrets."users/root/password".neededForUsers = true;

  security.sudo.extraConfig = ''
    # Disable sudo timeout (ask for password every time)
    Defaults timestamp_timeout=0
  '';

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
        hashedPasswordFile = config.sops.secrets."users/root/password".path;
      };
      ${mainUser} = {
        isNormalUser = true;
        home = "/home/${mainUser}";
        uid = 1000;
        group = mainUser;
        extraGroups = [ "wheel" ];
        hashedPasswordFile = config.sops.secrets."users/${mainUser}/password".path;
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
      };
    };
  };
}
