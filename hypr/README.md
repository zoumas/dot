# hypr

Hyprland configuration: window manager, wallpaper daemon, and lock screen.

## Contents

- **`hyprland.lua`** — the compositor itself. Monitor setup (the desktop's
  Dell U2724DE forced to 120Hz and matched by description so it survives
  being replugged into a different port; the laptop's `eDP-1` pinned to
  native scale, since Hyprland's own DPI detection picks a too-large 1.5),
  keyboard-driven keybindings (vim-style `hjkl` for focus/move/resize,
  workspaces, screenshots via `hyprshot`, media/volume on both `SUPER+F1-F10`
  and the `XF86Audio*` keys — the desktop's Glove80 has no XF86 keys, the
  laptop keyboard does, and binding a key the current keyboard never emits
  is harmless), and minimal look-and-feel (dwindle layout, small gaps, no
  shadows).
- **`hyprpaper.conf`** — wallpaper daemon config. Deliberately points at a
  generic, machine-local path (`~/Pictures/wallpaper`) instead of a specific
  image file — see **Setup** below.
- **`hyprlock.conf`** — lock screen. Matches the desktop theme, shows the
  time/date, and displays which keyboard layout (`EN`/`GR`) is currently
  active next to the password field.
- **`.luarc.json`** — points `lua_ls` (the Neovim Lua LSP) at
  `/usr/share/hypr/stubs/hl.meta.lua`, the type stub Hyprland itself ships
  for its Lua config API, and declares `hl` as a known global. Without
  this, editing `hyprland.lua` reports every `hl.*` call as an "Undefined
  global `hl`" diagnostic; with it, you also get real autocomplete/type
  info for the whole `hl.*` API.

Autostart (in `hyprland.lua`'s `hyprland.start` hook) also launches
`wayle shell` (see the `wayle` package), `hyprpolkitagent` — a lightweight
polkit authentication agent, without which GUI apps that need privilege
escalation (disk tools, NetworkManager actions, etc.) fail silently with
no password prompt — and `wl-paste --watch cliphist store`, which feeds
every copy into `cliphist`'s clipboard history (`SUPER+Shift+V` to browse
and re-copy an entry via `hyprlauncher`'s dmenu mode).

## Dependencies

```sh
sudo pacman -S hyprland hyprpaper hyprlock hyprshot wl-clipboard \
  playerctl wireplumber dolphin hyprpolkitagent cliphist rofimoji wtype
```

Also needs a terminal (see the `ghostty` package) and an app launcher
(`hyprlauncher`, referenced by `SUPER+R`).

`SUPER+.` opens an emoji picker via `rofimoji` (using `wofi` as the
selector, already installed) and types the chosen emoji directly into
the focused window via `wtype`.

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
