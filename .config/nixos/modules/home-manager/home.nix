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
    { pkgs, config, ... }:
    let
      link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
    in
    {
      services.gammastep = {
        enable = true;
        provider = "manual";
        latitude = "4.69";
        longitude = "-74.1";
      };

      systemd.user.services.xremap = {
        Unit = {
          Description = "xremap - foot pedal push-to-talk (mic gate)";
          After = [
            "graphical-session.target"
            "pipewire.service"
          ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          ExecStart = ''${pkgs.xremap}/bin/xremap --device "PCsensor FootSwitch Keyboard" --watch=device --allow-launch true ${config.xdg.configHome}/xremap/config.yml'';
          Restart = "on-failure";
          RestartSec = 5;
        };
        Install.WantedBy = [ "graphical-session.target" ];
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
          bubblewrap
          socat
          arc-theme
          awscli2
          bluetui
          brightnessctl
          btop
          cameractrls-gtk4
          claude-desktop
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
          gh
          git-extras
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
          librepods
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
          qbittorrent
          ranger
          ripgrep
          satty
          signal-desktop
          slurp
          sops
          spotify
          spotifyd
          stow
          swaybg
          swayosd
          terraform
          thunar
          time
          tmux
          tree-sitter
          unrar
          unzip
          usbutils
          viewnior
          vlc
          ironbar
          waylock
          waypaper
          wdisplays
          wget
          wireguard-tools
          wl-clipboard
          wlrctl
          wtype
          xdg-user-dirs
          xfce4-notifyd
          xremap
          ydotool
          zathura
          zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
          zip
          zsh
          zsh-completions
        ];
        file = {
          "${bin}/bookmarks".source = link "${bin}/bookmarks";
          "${bin}/recycle".source = link "${bin}/recycle";
          "${bin}/screenshot".source = link "${bin}/screenshot";
          "${bin}/sink_module".source = link "${bin}/sink_module";
          "${bin}/source_module".source = link "${bin}/source_module";
          "${bin}/toggle-audio-output".source = link "${bin}/toggle-audio-output";
          "${bin}/wclone".source = link "${bin}/wclone";
          "${share}/fonts".source = link "${share}/fonts";
          "${share}/themes".source = link "${share}/themes";
        };
      };

      xfconf.settings = {
        xfce4-notifyd = {
          "theme" = "Default";
          "initial-opacity" = 1.0;
          "notify-location" = "top-right";
          "do-fadeout" = false;
          "do-slideout" = false;
        };
      };

      xdg = {
        userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = true;
        };
        configFile = {
          "alacritty".source = link ".config/alacritty";
          "btop".source = link ".config/btop";
          "git".source = link ".config/git";
          "gtk-2.0".source = link ".config/gtk-2.0";
          "gtk-3.0".source = link ".config/gtk-3.0";
          "gtk-4.0".source = link ".config/gtk-4.0";
          "labwc".source = link ".config/labwc";
          "lf".source = link ".config/lf";
          "nvim".source = link ".config/nvim";
          "ranger".source = link ".config/ranger";
          "rofi".source = link ".config/rofi";
          "swayosd".source = link ".config/swayosd";
          "tmux".source = link ".config/tmux";
          "ironbar".source = link ".config/ironbar";
          "waypaper".source = link ".config/waypaper";
          "xremap".source = link ".config/xremap";
          "xsettingsd".source = link ".config/xsettingsd";
          "zathura".source = link ".config/zathura";
          "zsh".source = link ".config/zsh";
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
            categories = [
              "Network"
              "WebBrowser"
            ];
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
