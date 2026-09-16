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
        sansSerif = [
          "Inter"
          "Noto Sans"
        ];
        serif = [
          "Source Serif 4"
          "Noto Serif"
        ];
        emoji = [ "Twitter Color Emoji" ];
      };
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <match target="pattern">
            <edit name="family" mode="append" binding="strong">
              <string>Twitter Color Emoji</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
