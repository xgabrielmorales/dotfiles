# ~/dotfiles

This repository contains the configuration files for my WorkStation. Feel free to take and modify whatever you like; however, keep in mind that what is shown here reflects my personal preferences. Therefore, I would suggest thoroughly reviewing what you take before incorporating it into your configuration.

![rice](https://github.com/xgabrielmorales/dotfiles/assets/50029987/ee183470-b255-4df0-a72e-0c7b33920406)

## Distro: NixOS

[NixOS](https://nixos.org/) is my primary and only distribution. I appreciate its declarative configuration approach; I like the reproducibility and rollback capabilities; I value the extensive package collection from [Nixpkgs](https://search.nixos.org/packages). Previously: [Arch Linux](https://archlinux.org/).

My configuration can be found here: [NixOS](.config/nixos/).

## Window Manager: Hyprland

[Hyprland](https://hyprland.org/) is my current window manager running on Wayland. It's a dynamic *tiling* compositor that offers smooth animations, modern features, and excellent performance. Previously: [Openbox](http://openbox.org) and [i3wm](https://i3wm.org/).

You can find my configuration here: [Hyprland](.config/hypr/), [Openbox](.config/openbox/), [i3wm](.config/i3/).

## Status Bars: Waybar

[Waybar](https://github.com/Alexays/Waybar) is my current status bar for Wayland/Hyprland. It's highly customizable, supports modern features, and integrates perfectly with the Wayland ecosystem.

Previously, I used [Tint2](https://github.com/o9000/tint2) and [Polybar](https://polybar.github.io/) on X11. Both are easy to use and configure.

My configuration can be found here: [Waybar](.config/waybar), [Tint2](.config/tint2), [Polybar](.config/polybar).

## Window Switcher: Rofi

My preferred window switcher, more for its aesthetics, is Rofi. I find Dmenu to be too "plain". However, Rofi is equally lightweight, fast, and simple, which is what I'm after.

My configuration can be found here: [Rofi](.config/rofi).

## Terminal Emulator: Alacritty

In my quest for simplicity, I've used many terminal emulators, but only with [Alacritty](https://alacritty.org/) have I found what I'm looking for.

My configuration can be found here: [Alacritty](.config/alacritty/).

### Terminal Multiplexer: Tmux

An essential package since Alacritty lacks panels or tabs. Tmux allows you to have multiple terminal sessions in a single window with minimal effort.

My configuration can be found here: [Tmux](.config/tmux/tmux.conf).

## File Manager: Lf

[Lf](https://github.com/gokcehan/lf), formerly [Ranger](https://github.com/ranger/ranger), is my file manager for everything except when I need to drag a file somewhere. It's simple, fast, uses Vim keybindings, and is highly extensible.

My configuration can be found here: [Lf](.config/lf), [Ranger](.config/ranger).

## Text Editor - Neovim

I use [Neovim](https://neovim.io/) for programming; in the past, I used [Emacs](https://www.gnu.org/software/emacs/).

My configuration can be found here: [Nvim](.config/nvim/) and [Emacs](.config/emacs/).

## Others

Unlisted packages:

- Browser: [Zen Browser](https://zen-browser.app/)
- Document viewer: [Zathura](https://wiki.archlinux.org/title/Zathura)
- Media Player: [VLC](https://www.videolan.org/vlc/)
- Music Player:  ~~[Mpd](https://wiki.archlinux.org/title/Music_Player_Daemon) + Mpc + [Rofi MPD](https://github.com/xgabrielmorales/rofi-mpd)~~ Spotify.

### Typography Fonts

- Icons: [Feather](https://github.com/AT-UI/feather-font)
- Monospace: [JetBrains Mono Nerd Font](https://www.jetbrains.com/lp/mono/)
- Proportional: [Cantarell](https://fonts.google.com/specimen/Cantarell)
