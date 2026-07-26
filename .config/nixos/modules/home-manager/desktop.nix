{ pkgs, ... }:

{
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
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = "pdf.desktop";
        "image/jpeg" = "pdf.desktop";
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
}
