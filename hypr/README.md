# Hyprland

Personal [Hyprland](https://hyprland.org/) configuration: window manager config (via the Lua
config API), idle handling, screen locking, and wallpaper.

## Contents

- **`hyprland.lua`** — Main compositor config: monitor setup, autostart programs, look and feel
  (gaps, borders, blur, animations), input (including a US/Greek keyboard layout toggle),
  keybindings, and window/workspace rules. Written against Hyprland's Lua config API (`hl.*`)
  rather than the traditional `hyprland.conf` syntax.
- **`hypridle.conf`** — [hypridle](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/) config:
  locks the session after 10 minutes idle and turns off the display shortly after.
- **`hyprlock.conf`** — [hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) lock screen
  config, styled with the Catppuccin Mocha palette; shows the time, date, and current keyboard
  layout over a blurred screenshot background.
- **`hyprpaper.conf`** — [hyprpaper](https://wiki.hyprland.org/Hypr-Ecosystem/hyprpaper/) wallpaper
  config. **Monitor name and wallpaper path are hardcoded** (`DP-2`, `~/Pictures/skeleton.png`) and
  must be updated to match your own setup.

## Dependencies

Core:

- [Hyprland](https://hyprland.org/) — the compositor itself, with Lua config support enabled
- [hypridle](https://github.com/hyprwm/hypridle) — idle management
- [hyprlock](https://github.com/hyprwm/hyprlock) — screen locker
- [hyprpaper](https://github.com/hyprwm/hyprpaper) — wallpaper daemon

Used by autostart, keybindings, and window rules in `hyprland.lua`:

- [wayle](https://github.com/wayle-project/wayle) — status panel (`wayle panel start`)
- polkit-kde-agent (`/usr/lib/polkit-kde-authentication-agent-1`, part of `polkit-kde-agent`) —
  graphical authentication prompts
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (`wl-copy`/`wl-paste`) — clipboard access
- [cliphist](https://github.com/sentriz/cliphist) — clipboard history, used with `wl-paste --watch`
  and the `SUPER + SHIFT + V` clipboard picker
- [hyprlauncher](https://github.com/hyprland-community/hyprlauncher) — app launcher (`SUPER + R`)
  and clipboard picker menu
- [ghostty](https://ghostty.org/) — terminal emulator (`SUPER + RETURN`)
- [dolphin](https://apps.kde.org/dolphin/) — file manager (`SUPER + E`)
- [wlogout](https://github.com/ArtsyMacaw/wlogout) — logout/power menu (`SUPER + M`)
- [hyprpicker](https://github.com/hyprwm/hyprpicker) — color picker (`SUPER + SHIFT + P`)
- [grim](https://sr.ht/~emersion/grim/) and [slurp](https://github.com/emersion/slurp) —
  screenshots (`SUPER + S` / `SUPER + SHIFT + S`)
- `notify-send` (from [libnotify](https://gitlab.gnome.org/GNOME/libnotify)) — screenshot
  notifications
- `wpctl` (from [WirePlumber](https://gitlab.freedesktop.org/pipewire/wireplumber)) — volume/mute
  controls
- [playerctl](https://github.com/altdesktop/playerctl) — media player controls, targeting Spotify
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) — laptop backlight brightness
- a notification daemon (e.g. [mako](https://github.com/emersion/mako) or `wayle`'s own) for
  `notify-send` to have something to talk to

## Setup

1. Install the dependencies above (package names vary by distro — most are available in Arch's
   official repos or the AUR).
2. Symlink the config files into `~/.config/hypr/`:

   ```sh
   ln -s "$(pwd)/hyprland.lua" ~/.config/hypr/hyprland.lua
   ln -s "$(pwd)/hypridle.conf" ~/.config/hypr/hypridle.conf
   ln -s "$(pwd)/hyprlock.conf" ~/.config/hypr/hyprlock.conf
   ln -s "$(pwd)/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf
   ```

3. Edit `hyprpaper.conf` to point `monitor` at one of your actual output names (find them with
   `hyprctl monitors`) and `path` at a wallpaper you actually have.
4. Adjust `hyprland.lua`'s monitor block (mode/resolution) and `kb_layout` to match your hardware
   and locale.
5. Log into a Hyprland session. `hypridle`, `hyprpaper`, and the rest of the autostart programs
   are launched automatically from `hyprland.lua`'s `hl.on("hyprland.start", ...)` block.
