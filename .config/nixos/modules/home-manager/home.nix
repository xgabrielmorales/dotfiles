{ config, mainUser, ... }:

let
  dotfiles = "/home/${mainUser}/dotfiles";
  bin = ".local/bin";
  share = ".local/share";
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [ ./packages.nix ];

  home.username = mainUser;
  home.homeDirectory = "/home/${mainUser}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  xdg.configFile = {
    "alacritty".source = mkLink "${dotfiles}/.config/alacritty";
    "conky".source = mkLink "${dotfiles}/.config/conky";
    "git".source = mkLink "${dotfiles}/.config/git";
    "gtk-2.0".source = mkLink "${dotfiles}/.config/gtk-2.0";
    "gtk-3.0".source = mkLink "${dotfiles}/.config/gtk-3.0";
    "gtk-4.0".source = mkLink "${dotfiles}/.config/gtk-4.0";
    "lf".source = mkLink "${dotfiles}/.config/lf";
    "nvim".source = mkLink "${dotfiles}/.config/nvim";
    "openbox".source = mkLink "${dotfiles}/.config/openbox";
    "ranger".source = mkLink "${dotfiles}/.config/ranger";
    "rofi".source = mkLink "${dotfiles}/.config/rofi";
    "shell".source = mkLink "${dotfiles}/.config/shell";
    "skippy-xd".source = mkLink "${dotfiles}/.config/skippy-xd";
    "tint2".source = mkLink "${dotfiles}/.config/tint2";
    "tmux".source = mkLink "${dotfiles}/.config/tmux";
    "zathura".source = mkLink "${dotfiles}/.config/zathura";
    "zen".source = mkLink "${dotfiles}/.config/zen";
    "zsh".source = mkLink "${dotfiles}/.config/zsh";
  };
  home.file = {
    "${bin}/bookmarks".source = mkLink "${dotfiles}/${bin}/bookmarks";
    "${bin}/brightness_module".source =
      mkLink "${dotfiles}/${bin}/brightness_module";
    "${bin}/recycle".source = mkLink "${dotfiles}/${bin}/recycle";
    "${bin}/remove-unused-desktop-apps".source =
      mkLink "${dotfiles}/${bin}/remove-unused-desktop-apps";
    "${bin}/screenshot".source = mkLink "${dotfiles}/${bin}/screenshot";
    "${bin}/sink_module".source = mkLink "${dotfiles}/${bin}/sink_module";
    "${bin}/source_module".source = mkLink "${dotfiles}/${bin}/source_module";
    "${bin}/toggle-audio-output".source =
      mkLink "${dotfiles}/${bin}/toggle-audio-output";
    "${share}/applications".source = mkLink "${dotfiles}/${share}/applications";
    "${share}/fonts".source = mkLink "${dotfiles}/${share}/fonts";
    "${share}/themes".source = mkLink "${dotfiles}/${share}/themes";
  };
}
