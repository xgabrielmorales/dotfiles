{ pkgs, ... }:

{
  users.users = {
    xgm = {
      isNormalUser = true;
      description = "Gabriel Morales";
      home = "/home/xgm";
      extraGroups = [ "wheel" ];
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
}
