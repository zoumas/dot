# hypr

Hyprland configuration: window manager, wallpaper daemon, and lock screen.

## Contents

- **`hyprland.lua`** — the compositor itself. Monitor setup (forced 120Hz on
  the Dell U2724DE, matched by description so it survives being replugged
  into a different port), keyboard-driven keybindings (vim-style `hjkl` for
  focus/move/resize, workspaces, screenshots via `hyprshot`, media/volume on
  `SUPER+F1-F10` since the Glove80 has no XF86 keys), and minimal
  look-and-feel (dwindle layout, small gaps, no shadows).
- **`hyprpaper.conf`** — wallpaper daemon config. Deliberately points at a
  generic, machine-local path (`~/Pictures/wallpaper`) instead of a specific
  image file — see **Setup** below.
- **`hyprlock.conf`** — lock screen. Matches the desktop theme, shows the
  time/date, and displays which keyboard layout (`EN`/`GR`) is currently
  active next to the password field.

Autostart (in `hyprland.lua`'s `hyprland.start` hook) also launches
`wayle shell` (see the `wayle` package) and `hyprpolkitagent`, a
lightweight polkit authentication agent — without one, GUI apps that need
privilege escalation (disk tools, NetworkManager actions, etc.) fail
silently with no password prompt.

## Dependencies

```sh
sudo pacman -S hyprland hyprpaper hyprlock hyprshot wl-clipboard \
  playerctl wireplumber dolphin hyprpolkitagent
```

Also needs a terminal (see the `ghostty` package) and an app launcher
(`hyprlauncher`, referenced by `SUPER+R`).

## Setup

`hyprpaper` reads its wallpaper from `~/Pictures/wallpaper`, which is a
symlink you create yourself (not tracked in git, since the actual image is
personal/machine-specific):

```sh
ln -sf /path/to/your/image ~/Pictures/wallpaper
```

Swapping wallpapers later is just re-pointing that symlink — no config edit
needed.

## Keybindings

See the `KEYBINDINGS` section of `hyprland.lua` for the full list; the
short version is `SUPER` + `hjkl` for focus, `+ Shift` to move windows,
`+ Ctrl` to resize, and `Return`/`R`/`E`/`W` for terminal/launcher/files/browser.
