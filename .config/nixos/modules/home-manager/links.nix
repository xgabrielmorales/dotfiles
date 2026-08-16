{
  config,
  mainUser,
  ...
}:

let
  dotfiles = "/home/${mainUser}/dotfiles";
  bin = ".local/bin";
  share = ".local/share";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  home.file = {
    "${bin}/bookmarks".source = link "${bin}/bookmarks";
    "${bin}/brightness_module".source = link "${bin}/brightness_module";
    "${bin}/dictate".source = link "${bin}/dictate";
    "${bin}/mic-check".source = link "${bin}/mic-check";
    "${bin}/recycle".source = link "${bin}/recycle";
    "${bin}/screenshot".source = link "${bin}/screenshot";
    "${bin}/sink_module".source = link "${bin}/sink_module";
    "${bin}/source_module".source = link "${bin}/source_module";
    "${bin}/toggle-audio-output".source = link "${bin}/toggle-audio-output";
    "${bin}/toggle-ironbar".source = link "${bin}/toggle-ironbar";
    "${bin}/wclone".source = link "${bin}/wclone";
    "${share}/fonts".source = link "${share}/fonts";
    "${share}/themes".source = link "${share}/themes";
  };

  xdg.configFile = {
    "alacritty".source = link ".config/alacritty";
    "atuin/config.toml".source = link ".config/atuin/config.toml";
    "btop".source = link ".config/btop";
    "direnv/direnvrc".source = link ".config/direnv/direnvrc";
    "emacs/init.el".source = link ".config/emacs/init.el";
    "git".source = link ".config/git";
    "gtk-2.0".source = link ".config/gtk-2.0";
    "gtk-3.0".source = link ".config/gtk-3.0";
    "gtk-4.0".source = link ".config/gtk-4.0";
    "labwc".source = link ".config/labwc";
    "lf".source = link ".config/lf";
    "nvim".source = link ".config/nvim";
    "ranger".source = link ".config/ranger";
    "rofi".source = link ".config/rofi";
    "tmux".source = link ".config/tmux";
    "ironbar".source = link ".config/ironbar";
    "waypaper".source = link ".config/waypaper";
    "xremap".source = link ".config/xremap";
    "xsettingsd".source = link ".config/xsettingsd";
    "zathura".source = link ".config/zathura";
    "zsh".source = link ".config/zsh";
  };
}
