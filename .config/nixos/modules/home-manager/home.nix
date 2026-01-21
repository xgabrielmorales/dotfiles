{ mainUser, ... }:

let
  dotfiles = "/home/${mainUser}/dotfiles";
  bin = ".local/bin";
  share = ".local/share";
in {
  imports = [ ./packages.nix ];

  home.username = mainUser;
  home.homeDirectory = "/home/${mainUser}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  xdg.configFile = {
    "alacritty".source = "${dotfiles}/.config/alacritty";
    "conky".source = "${dotfiles}/.config/conky";
    "git".source = "${dotfiles}/.config/git";
    "gtk-2.0".source = "${dotfiles}/.config/gtk-2.0";
    "gtk-3.0".source = "${dotfiles}/.config/gtk-3.0";
    "gtk-4.0".source = "${dotfiles}/.config/gtk-4.0";
    "hypr".source = "${dotfiles}/.config/hypr";
    "lf".source = "${dotfiles}/.config/lf";
    "nvim".source = "${dotfiles}/.config/nvim";
    "ranger".source = "${dotfiles}/.config/ranger";
    "rofi".source = "${dotfiles}/.config/rofi";
    "shell".source = "${dotfiles}/.config/shell";
    "tmux".source = "${dotfiles}/.config/tmux";
    "waybar".source = "${dotfiles}/.config/waybar";
    "xsettingsd".source = "${dotfiles}/.config/xsettingsd";
    "zathura".source = "${dotfiles}/.config/zathura";
    "zen".source = "${dotfiles}/.config/zen";
    "zsh".source = "${dotfiles}/.config/zsh";
  };
  home.file = {
    "${bin}/bookmarks".source = "${dotfiles}/${bin}/bookmarks";
    "${bin}/recycle".source = "${dotfiles}/${bin}/recycle";
    "${bin}/screenshot".source = "${dotfiles}/${bin}/screenshot";
    "${bin}/sink_module".source = "${dotfiles}/${bin}/sink_module";
    "${bin}/source_module".source = "${dotfiles}/${bin}/source_module";
    "${bin}/toggle-audio-output".source =
      "${dotfiles}/${bin}/toggle-audio-output";
    "${share}/applications".source = "${dotfiles}/${share}/applications";
    "${share}/fonts".source = "${dotfiles}/${share}/fonts";
    "${share}/themes".source = "${dotfiles}/${share}/themes";
  };
}
