# ~/dotfiles

This repository contains the configuration files for my WorkStation. Feel free to take and modify whatever you like; however, keep in mind that what is shown here reflects my personal preferences. Therefore, I would suggest thoroughly reviewing what you take before incorporating it into your configuration.

![rice](https://github.com/xgabrielmorales/dotfiles/assets/50029987/ee183470-b255-4df0-a72e-0c7b33920406)

## Distro: Arch Linux

I use [Arch Linux](https://archlinux.org/) as my primary and only distribution. I appreciate the simplicity of the distro; I like the abundance of packages from [Pacman](https://archlinux.org/packages/) and [AUR](https://aur.archlinux.org/); I value its thorough and comprehensive documentation.

## Window Manager: Openbox

[Openbox](http://openbox.org) is a *floating* window manager, and it's my current choice. It's an excellent option for a desktop environment as it provides just enough to function.

[I3wm](https://i3wm.org/) is the *tiling* window manager I also use. It's sufficient for my needs, easy to configure, and use, although perhaps somewhat limited in terms of flexibility.

You can find my configuration here: [Openbox](.config/openbox/), [i3wm](.config/i3/).

## Status Bars: Tint2

[Tint2](https://github.com/o9000/tint2) is my current status bar. In the past, I used [Polybar](https://polybar.github.io/). Both are easy to use and configure. They're nothing special but get the job done.

My configuration can be found here: [Tint2](.config/tint2), [Polybar](.config/polybar).

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

I use [Neovim](https://neovim.io/) for programming; in the past, I used [Emacs](https://www.gnu.org/software/emacs/). Nowadays, I'm also learning to use [VSCode](https://code.visualstudio.com/). I try not to depend on a single editor.

My configuration can be found here: [Nvim](.config/nvim/) and [Emacs](.config/emacs/).

## Others

Unlisted packages:

- Browser: [Zen Browser](https://zen-browser.app/)
- Document viewer: [Zathura](https://wiki.archlinux.org/title/Zathura)
- Media Player: [Mpv](https://wiki.archlinux.org/title/Mpv)
- Music Player: [Mpd](https://wiki.archlinux.org/title/Music_Player_Daemon) + Mpc + [Rofi MPD](https://github.com/xgabrielmorales/rofi-mpd)

### Typography Fonts

- Icons: [Feather](https://github.com/AT-UI/feather-font)
- Monospace: [JetBrains Mono Nerd Font](https://www.jetbrains.com/lp/mono/)
- Proportional: [Cantarell](https://fonts.google.com/specimen/Cantarell)
