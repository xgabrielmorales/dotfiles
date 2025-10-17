{ pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword =
          "$6$LFjitH4qaP2ZlWvx$2tiE98H92SGMkM3g9lHHZIBsv3h56evEgcnl9RaGbwJUmqYG7nrQKyCl9iOnLYCb5xWIgD8Vbw/Sk2vI75xSn.";
      };
      xgm = {
        isNormalUser = true;
        description = "Gabriel Morales";
        home = "/home/xgm";
        extraGroups = [ "wheel" ];
        hashedPassword =
          "$6$NrF8dQmb8fp6DBZy$Zgb.IEodEdox3nIyxdCjr6bbgm3J6tCP5nwjXN.qDsYyyzsfNOnNpPqqDlAKoClHHN8A5fISaICfrCEdd.Kcr0";
        shell = pkgs.zsh;
        packages = with pkgs; [
          alacritty
          arc-theme
          blueman
          bluez
          cameractrls-gtk4
          claude-code
          csvlens
          diff-so-fancy
          discord
          docker-buildx
          docker-compose
          docker_28
          eza
          fd
          fzf
          git-extras
          gucharmap
          hunspell
          jq
          lf
          libnotify
          lxappearance
          maim
          ncdu
          neofetch
          neovim
          nitrogen
          nodejs_24
          pamixer
          papirus-icon-theme
          pavucontrol
          ranger
          redshift
          ripgrep
          rofi
          rofi-calc
          rofi-emoji
          satty
          simplescreenrecorder
          skippy-xd
          spotify
          stow
          syncthing
          tmux
          typora
          viewnior
          vlc
          wireguard-tools
          wmctrl
          xclip
          xdg-user-dirs
          xdotool
          xfce.thunar
          xorg.xev
          zathura
          zsh-completions
        ];
      };
    };
  };
}
