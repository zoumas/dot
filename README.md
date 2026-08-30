# dot

Personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a Stow "package" whose contents mirror `$HOME`.
For example:

```
dot/
├── bash/
│   ├── .bashrc
│   └── .bash_profile
└── kitty/
    └── .config/
        └── kitty/
            └── kitty.conf
```

## Usage

Install Stow:

```sh
sudo pacman -S stow
```

Symlink a package into `$HOME` (run from the repo root):

```sh
stow <package>
```

Symlink everything:

```sh
stow */
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
