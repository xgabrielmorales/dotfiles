{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cantarell-fonts
    icomoon-feather
    nerd-fonts.jetbrains-mono
    twitter-color-emoji
  ];
}
