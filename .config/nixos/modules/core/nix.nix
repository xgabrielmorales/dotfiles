{ ... }:

{
  nix.channel.enable = false;
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  # nix-ld
  programs.nix-ld.enable = true;
}
