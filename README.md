# dot

Personal dotfiles for an Arch Linux + Hyprland desktop, managed with
[GNU Stow](https://www.gnu.org/software/stow/).

## What's in here

| Package | Provides |
| --- | --- |
| [`hypr`](hypr/README.md) | Hyprland (window manager), wallpaper daemon, lock screen |
| [`ghostty`](ghostty/README.md) | Terminal emulator |
| [`nvim`](nvim/README.md) | Neovim, based on the LazyVim starter |
| [`wayle`](wayle/README.md) | Desktop shell (bar) |
| [`zsh`](zsh/README.md) | Shell, based on zensh, plus atuin/eza/bat |

All five share a consistent Gruvbox Material theme.

## Layout

Each top-level directory is a Stow "package" whose contents mirror `$HOME`.
For example:

```
dot/
├── bash/
│   ├── .bashrc
│   └── .bash_profile
└── ghostty/
    └── .config/
        └── ghostty/
            └── config
```

## Getting started

1. Install Stow and clone this repo:

   ```sh
   sudo pacman -S stow
   git clone <this-repo> ~/work/repos/github.com/zoumas/dot
   cd ~/work/repos/github.com/zoumas/dot
   ```

2. Install each package's dependencies — see the package's own README
   (linked in the table above) for the exact `pacman` command and any
   manual setup step (e.g. `hypr` needs a wallpaper symlink, `zsh` needs
   `chsh`, `wayle` needs its systemd service enabled).

3. Symlink the packages you want:

   ```sh
   stow hypr ghostty nvim wayle zsh
   ```

   Or symlink everything: `stow */`.

4. Reload/restart the relevant app (`hyprctl reload`, a new terminal, etc.)
   and follow any package-specific first-run steps (LazyVim installing
   plugins, `p10k configure`, and so on).

## Usage

Symlink a package into `$HOME` (run from the repo root):

```sh
stow <package>
```

Remove a package's symlinks:

```sh
stow -D <package>
```

Re-sync after changing a package's contents:

```sh
stow -R <package>
```

## Adding a new config

1. Create `<package>/` mirroring the path relative to `$HOME`
   (e.g. `nvim/.config/nvim/init.lua`).
2. Move the real file into that path.
3. Run `stow <package>` to symlink it back into place.
4. Add a `<package>/README.md` describing what it provides and any
   dependencies/setup steps, and link it from the table above.
