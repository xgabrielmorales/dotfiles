{
  pkgs,
  mainUser,
  zen-browser,
  ...
}:

let
  dotfiles = "/home/${mainUser}/dotfiles";
  bin = ".local/bin";
  share = ".local/share";
in
{
  home.username = mainUser;
  home.homeDirectory = "/home/${mainUser}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = "4.69";
    longitude = "-74.1";
  };

  # Packages (from packages.nix)
  home.packages = with pkgs; [
    (rofi.override {
      plugins = [
        rofi-calc
        rofi-emoji
      ];
    })
    age
    alacritty
    arc-theme
    awscli2
    bat
    bubblewrap
    cameractrls-gtk4
    claude-code
    corepack_24
    csvlens
    diff-so-fancy
    direnv
    eza
    fd
    file
    firefox
    fzf
    gh
    git-extras
    google-cloud-sdk
    grim
    gucharmap
    hunspell
    jetbrains.datagrip
    jq
    just
    lf
    libnotify
    neovim
    net-tools
    nodejs_24
    nwg-look
    obs-studio
    openssl_oqs
    pamixer
    papirus-icon-theme
    pavucontrol
    pipx
    pistol
    playerctl
    postman
    python314
    ranger
    satty
    signal-desktop
    slurp
    socat
    sops
    spotify
    stow
    swaybg
    terraform
    thunar
    tmux
    typora
    viewnior
    vlc
    waybar
    waypaper
    wireguard-tools
    wl-clipboard
    wlrctl
    wtype
    xdg-user-dirs
    xfce4-notifyd
    ydotool
    zathura
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    zsh
    zsh-completions
  ];

  # Home files
  home.file = {
    "${bin}/bookmarks".source = "${dotfiles}/${bin}/bookmarks";
    "${bin}/recycle".source = "${dotfiles}/${bin}/recycle";
    "${bin}/screenshot".source = "${dotfiles}/${bin}/screenshot";
    "${bin}/sink_module".source = "${dotfiles}/${bin}/sink_module";
    "${bin}/source_module".source = "${dotfiles}/${bin}/source_module";
    "${bin}/toggle-audio-output".source = "${dotfiles}/${bin}/toggle-audio-output";
    "${share}/fonts".source = "${dotfiles}/${share}/fonts";
    "${share}/themes".source = "${dotfiles}/${share}/themes";
  };
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    configFile = {
      "alacritty".source = "${dotfiles}/.config/alacritty";
      "git".source = "${dotfiles}/.config/git";
      "gtk-2.0".source = "${dotfiles}/.config/gtk-2.0";
      "gtk-3.0".source = "${dotfiles}/.config/gtk-3.0";
      "gtk-4.0".source = "${dotfiles}/.config/gtk-4.0";
      "labwc".source = "${dotfiles}/.config/labwc";
      "lf".source = "${dotfiles}/.config/lf";
      "nvim".source = "${dotfiles}/.config/nvim";
      "ranger".source = "${dotfiles}/.config/ranger";
      "rofi".source = "${dotfiles}/.config/rofi";
      "shell".source = "${dotfiles}/.config/shell";
      "tmux".source = "${dotfiles}/.config/tmux";
      "waybar".source = "${dotfiles}/.config/waybar";
      "xsettingsd".source = "${dotfiles}/.config/xsettingsd";
      "zathura".source = "${dotfiles}/.config/zathura";
      "zsh".source = "${dotfiles}/.config/zsh";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        # Images
        "image/*" = "img.desktop";
        # Video
        "video/*" = "video.desktop";
        # Text Files
        "text/*" = "text.desktop";
        # Documents
        "application/pdf" = "pdf.desktop";
        # Browser (Personal)
        "x-scheme-handler/about" = "browser-personal.desktop";
        "x-scheme-handler/http" = "browser-personal.desktop";
        "x-scheme-handler/https" = "browser-personal.desktop";
        "x-scheme-handler/unknown" = "browser-personal.desktop";
      };
    };
    desktopEntries = {
      "browser-personal" = {
        name = "Web Browser (Personal)";
        icon = "zen-browser";
        exec = "recycle zen-beta";
        type = "Application";
      };
      "browser-work" = {
        name = "Web Browser (Work)";
        icon = "firefox";
        exec = "recycle firefox";
        type = "Application";
      };
      "img" = {
        name = "Image Viewer";
        exec = "${pkgs.viewnior}/bin/viewnior %F";
        type = "Application";
      };
      "pdf" = {
        name = "PDF Reader";
        exec = "${pkgs.zathura}/bin/zathura %u";
        type = "Application";
      };
      "text" = {
        name = "Text Editor";
        exec = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.neovim}/bin/nvim %u";
        type = "Application";
      };
      "video" = {
        name = "Video Viewer";
        exec = "${pkgs.vlc}/bin/vlc %f";
        type = "Application";
      };
    };
  };
}
