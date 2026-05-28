{
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
  home-manager.users.${mainUser} =
    { pkgs, ... }:
    {
      services.gammastep = {
        enable = true;
        provider = "manual";
        latitude = "4.69";
        longitude = "-74.1";
      };

      programs.home-manager.enable = true;

      home = {
        username = mainUser;
        homeDirectory = "/home/${mainUser}";
        stateVersion = "25.05";
        packages = with pkgs; [
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
          bluetui
          brightnessctl
          btop
          bubblewrap
          cameractrls-gtk4
          cargo
          corepack_24
          csvlens
          delta
          dig
          direnv
          eza
          fd
          file
          firefox
          fzf
          gcc
          gh
          git-extras
          gnumake
          google-cloud-sdk
          grim
          gucharmap
          hunspell
          impala
          jetbrains.datagrip
          jq
          just
          lf
          libnotify
          lm_sensors
          ncdu
          neovim
          net-tools
          nixfmt-tree
          nodejs_24
          nwg-look
          obs-studio
          openssl_oqs
          pamixer
          papirus-icon-theme
          pavucontrol
          pciutils
          playerctl
          postman-agent
          python314
          ranger
          ripgrep
          rustc
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
          time
          tmux
          tree-sitter
          typora
          unrar
          unzip
          usbutils
          viewnior
          vlc
          waybar
          waypaper
          wdisplays
          wget
          wireguard-tools
          wl-clipboard
          wlrctl
          wtype
          xdg-user-dirs
          xfce4-notifyd
          ydotool
          zathura
          zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
          zip
          zsh
          zsh-completions
        ];
        file = {
          "${bin}/bookmarks".source = "${dotfiles}/${bin}/bookmarks";
          "${bin}/recycle".source = "${dotfiles}/${bin}/recycle";
          "${bin}/screenshot".source = "${dotfiles}/${bin}/screenshot";
          "${bin}/sink_module".source = "${dotfiles}/${bin}/sink_module";
          "${bin}/source_module".source = "${dotfiles}/${bin}/source_module";
          "${bin}/toggle-audio-output".source = "${dotfiles}/${bin}/toggle-audio-output";
          "${share}/fonts".source = "${dotfiles}/${share}/fonts";
          "${share}/themes".source = "${dotfiles}/${share}/themes";
        };
      };

      xdg = {
        userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = true;
        };
        configFile = {
          "alacritty".source = "${dotfiles}/.config/alacritty";
          "btop".source = "${dotfiles}/.config/btop";
          "git".source = "${dotfiles}/.config/git";
          "gtk-2.0".source = "${dotfiles}/.config/gtk-2.0";
          "gtk-3.0".source = "${dotfiles}/.config/gtk-3.0";
          "gtk-4.0".source = "${dotfiles}/.config/gtk-4.0";
          "labwc".source = "${dotfiles}/.config/labwc";
          "lf".source = "${dotfiles}/.config/lf";
          "nvim".source = "${dotfiles}/.config/nvim";
          "ranger".source = "${dotfiles}/.config/ranger";
          "rofi".source = "${dotfiles}/.config/rofi";
          "tmux".source = "${dotfiles}/.config/tmux";
          "waybar".source = "${dotfiles}/.config/waybar";
          "waypaper".source = "${dotfiles}/.config/waypaper";
          "xsettingsd".source = "${dotfiles}/.config/xsettingsd";
          "zathura".source = "${dotfiles}/.config/zathura";
          "zsh".source = "${dotfiles}/.config/zsh";
        };
        mimeApps = {
          enable = true;
          defaultApplications = {
            "image/png" = "pdf.desktop";
            "image/jpg" = "pdf.desktop";
            "image/*" = "img.desktop";
            "video/*" = "video.desktop";
            "text/*" = "text.desktop";
            "application/pdf" = "pdf.desktop";
            "application/x-extension-htm" = "zen-beta.desktop";
            "application/x-extension-html" = "zen-beta.desktop";
            "application/x-extension-shtml" = "zen-beta.desktop";
            "application/x-extension-xht" = "zen-beta.desktop";
            "application/x-extension-xhtml" = "zen-beta.desktop";
            "application/xhtml+xml" = "zen-beta.desktop";
            "text/html" = "zen-beta.desktop";
            "x-scheme-handler/about" = "zen-beta.desktop";
            "x-scheme-handler/chrome" = "zen-beta.desktop";
            "x-scheme-handler/http" = "zen-beta.desktop";
            "x-scheme-handler/https" = "zen-beta.desktop";
            "x-scheme-handler/unknown" = "zen-beta.desktop";
          };
        };
        desktopEntries = {
          "zen-beta" = {
            name = "Web Browser (Personal)";
            icon = "zen-browser";
            exec = "recycle zen-beta %U";
            type = "Application";
            categories = [ "Network" "WebBrowser" ];
            mimeType = [
              "application/x-extension-htm"
              "application/x-extension-html"
              "application/x-extension-shtml"
              "application/x-extension-xht"
              "application/x-extension-xhtml"
              "application/xhtml+xml"
              "text/html"
              "x-scheme-handler/about"
              "x-scheme-handler/chrome"
              "x-scheme-handler/http"
              "x-scheme-handler/https"
              "x-scheme-handler/unknown"
            ];
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
    };

  home-manager.extraSpecialArgs = { inherit mainUser zen-browser; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
}
