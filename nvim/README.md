# nvim

Neovim configuration, based on the official
[LazyVim starter template](https://github.com/LazyVim/starter).

> Note: `.config/nvim/README.md` (one level down) is LazyVim's own README,
> vendored as part of the starter template and stowed into `~/.config/nvim`.
> This file is the package-level one, describing what's customized here.

## What's customized on top of the stock starter

- **`lua/plugins/colorscheme.lua`** — `sainnhe/gruvbox-material`
  (`background = "medium"`), matching the rest of the desktop's theme
  instead of LazyVim's default TokyoNight.
- **`lua/plugins/snacks.lua`** — hidden files (dotfiles) are shown by
  default in both the file picker (`<leader>ff`) and the file explorer
  (`<leader>fe`); gitignored files are still hidden.

Everything else (`init.lua`, `lua/config/*`, `lua/plugins/example.lua`,
`stylua.toml`, `.neoconf.json`) is the unmodified starter template.

`lazy-lock.json` pins exact plugin versions and is tracked for
reproducibility — don't hand-edit it, it's rewritten by `:Lazy`.

## Dependencies

```sh
sudo pacman -S neovim git ripgrep fd fzf base-devel tree-sitter-cli
```

A [Nerd Font](https://www.nerdfonts.com/) is required for icons to render
correctly — the terminal already provides one (see the `ghostty` package).

Optional: `lazygit` (`sudo pacman -S lazygit`) enables LazyVim's built-in
git UI (`<leader>gg`). Not installed by default in this setup.

## First run

On first launch, `lazy.nvim` installs all plugins and compiles Treesitter
parsers automatically — this can take a minute. Run `:checkhealth` afterward
to confirm nothing's missing.
