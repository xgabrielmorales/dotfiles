{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
      source-serif
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      twitter-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Inter" "Noto Sans" ];
        serif = [ "Source Serif 4" "Noto Serif" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
