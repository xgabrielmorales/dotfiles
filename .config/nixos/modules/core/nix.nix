_:

{
  nix = {
    channel.enable = false;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    settings = {
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      download-buffer-size = 536870912; # 512 MB
      use-xdg-base-directories = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;
}
