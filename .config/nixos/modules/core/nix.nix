{ ... }:

{
  nix.channel.enable = false;
  nix.settings.auto-optimise-store = true;
  nix.settings.download-buffer-size = 536870912; # 512 MB
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: true;
  programs.nix-ld.enable = true;
}
