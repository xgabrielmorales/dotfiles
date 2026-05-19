{
  config,
  mainUser,
  pkgs,
  zen-browser,
  ...
}:

{
  sops.secrets."users/${mainUser}/password".neededForUsers = true;
  sops.secrets."users/root/password".neededForUsers = true;

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

  home-manager.users.${mainUser} = import ./home.nix;
  home-manager.extraSpecialArgs = { inherit mainUser zen-browser; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
}
