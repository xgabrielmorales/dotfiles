{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      cantarell-fonts
      icomoon-feather
      nerd-fonts.jetbrains-mono
      noto-fonts
      twitter-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };
}
