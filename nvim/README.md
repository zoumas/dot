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
- **Go support** — `lua/config/lazy.lua` imports LazyVim's `dap.core`,
  `test.core`, and `lang.go` extras (in that order — `lang.go`'s
  debugger/test-runner integration hooks into the other two, and load
  order matters for LazyVim extras; see [LazyVim's extras
  docs](https://www.lazyvim.org/configuration/extras)). This wires up
  `gopls`, `gofumpt`/`goimports` formatting, `golangci-lint` linting,
  `nvim-dap-go` debugging (via `delve`), and `neotest-golang` test running.
  `lua/plugins/go.lua` additionally sets `mason = false` for `gopls`,
  since it's expected to come from `go install` (see the `zsh` package's
  `GOBIN`) rather than Mason's own async install-then-enable — without
  that, `gopls` silently never attaches until Mason finishes installing
  its own copy.

  These extras were enabled by editing `lazy.lua` directly rather than
  through the `:LazyExtras` UI, so `lazyvim.json`'s `extras` list stays
  empty — that's just cosmetic (it's `:LazyExtras`' own bookkeeping, not
  something that gates loading), but the UI will show them as unchecked.

Everything else (`init.lua`, `lua/config/options.lua`,
`lua/config/keymaps.lua`, `lua/config/autocmds.lua`,
`lua/plugins/example.lua`, `stylua.toml`, `.neoconf.json`) is the
unmodified starter template.

`lazy-lock.json` pins exact plugin versions and is tracked for
reproducibility — don't hand-edit it, it's rewritten by `:Lazy`.

## Dependencies

```sh
sudo pacman -S neovim git ripgrep fd fzf base-devel tree-sitter-cli
```

For Go support: the `go` toolchain itself (`sudo pacman -S go`), plus
`go install golang.org/x/tools/gopls@latest` (see the `zsh` package's
`GOBIN`/`PATH` setup, which puts it on `PATH`). `gofumpt`/`goimports`/
`golangci-lint`/`delve` are installed automatically by Mason on first use.

A [Nerd Font](https://www.nerdfonts.com/) is required for icons to render
correctly — the terminal already provides one (see the `ghostty` package).

Optional: `lazygit` (`sudo pacman -S lazygit`) enables LazyVim's built-in
git UI (`<leader>gg`). Not installed by default in this setup.

## First run

On first launch, `lazy.nvim` installs all plugins and compiles Treesitter
parsers automatically — this can take a minute. Run `:checkhealth` afterward
to confirm nothing's missing.
