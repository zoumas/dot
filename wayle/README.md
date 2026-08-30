# wayle

Configuration for [wayle](https://github.com/wayle-rs/wayle), the desktop
shell (bar, etc.) used alongside Hyprland.

## Contents

- **`config.toml`**:
  - Bar layout: workspaces on the left, the media player centered, and
    bluetooth/network/volume on the right. Battery and microphone are
    deliberately left out — this machine is a desktop with no battery, and
    microphone/volume read as redundant.
  - Module colors: bluetooth/volume/media are pinned to the `accent` token
    (they default to blue/red/blue respectively) so every module matches
    the workspace indicator and network module, which already default to
    `accent`.
  - Styling: a static Gruvbox Material palette (`theme-provider = "wayle"`)
    matching `ghostty`/`nvim`, with the accent color lightened well past
    the base Gruvbox orange into a soft cream (`#d4be98`).
- **`tombi.toml`**, **`styles/index.scss`** — scaffolding wayle generates on
  first run; tracked as-is (the `.scss` file is just an empty customization
  entrypoint).

Not tracked: the two `schema.json` files wayle also writes into
`~/.config/wayle` (one at the root, one under `themes/`). These are
auto-regenerated boilerplate for editor validation, not user config.

## Dependencies

```sh
sudo pacman -S wayle
```

## Setup

wayle ships its own systemd user service, but it isn't enabled by default.
Enable it so the shell actually survives a reboot:

```sh
systemctl --user enable --now wayle.service
```

(Don't also add a Hyprland `exec-once` for this — it would double-launch
wayle alongside the systemd service.)
