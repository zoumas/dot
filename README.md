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
| [`git`](git/README.md) | Git config: delta pager, zdiff3, sane defaults |

The desktop-facing packages (`hypr`, `ghostty`, `nvim`, `wayle`, `zsh`)
share a consistent Gruvbox Material theme.

See [`TOOLS.md`](TOOLS.md) for a reference list of the CLI tools this
setup relies on, including a few standalone ones not tied to any package.

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
   `chsh`).

3. Symlink the packages you want:

   ```sh
   stow -t ~ hypr ghostty nvim wayle zsh git
   ```

   Or symlink everything: `stow -t ~ */`.

   `-t ~` is required. Stow defaults its target to the *parent* of the
   directory it's run from, which is only `$HOME` when the repo is cloned
   directly into `$HOME`. This one lives under `~/work/repos/...`, so
   without `-t ~` stow would link the packages into
   `~/work/repos/github.com/zoumas/` instead.

4. Reload/restart the relevant app (`hyprctl reload`, a new terminal, etc.)
   and follow any package-specific first-run steps (LazyVim installing
   plugins, `p10k configure`, and so on).

## Usage

Symlink a package into `$HOME` (run from the repo root):

```sh
stow -t ~ <package>
```

Remove a package's symlinks:

```sh
stow -D -t ~ <package>
```

Re-sync after changing a package's contents:

```sh
stow -R -t ~ <package>
```

Add `-n -v` to any of these to see what stow would do without touching
the filesystem.

## Adding a new config

1. Create `<package>/` mirroring the path relative to `$HOME`
   (e.g. `nvim/.config/nvim/init.lua`).
2. Move the real file into that path.
3. Run `stow -t ~ <package>` to symlink it back into place.
4. Add a `<package>/README.md` describing what it provides and any
   dependencies/setup steps, and link it from the table above.
