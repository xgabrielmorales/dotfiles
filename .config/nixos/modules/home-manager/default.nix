{
  mainUser,
  zen-browser,
  ...
}:

{
  home-manager.users.${mainUser} = {
    imports = [
      ./packages.nix
      ./links.nix
      ./desktop.nix
      ./services.nix
    ];
    programs.home-manager.enable = true;
    home = {
      username = mainUser;
      homeDirectory = "/home/${mainUser}";
      stateVersion = "25.05";
    };
  };

  home-manager.extraSpecialArgs = { inherit mainUser zen-browser; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
}
