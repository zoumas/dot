# Dotfiles

Personal configuration files for my development environment.

## Contents

- **[`zsh/`](zsh/README.md)** — Zsh config using [zinit](https://github.com/zdharma-continuum/zinit) as
  plugin manager, with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) as prompt, plus
  syntax highlighting, completions, autosuggestions, and fzf-tab. Integrates
  [fzf](https://github.com/junegunn/fzf), [zoxide](https://github.com/ajeetdsouza/zoxide),
  [fd](https://github.com/sharkdp/fd), [eza](https://github.com/eza-community/eza),
  [bat](https://github.com/sharkdp/bat), and [gh](https://cli.github.com/). See its README for
  details.

- **[`nvim/`](nvim/)** — Neovim config based on [LazyVim](https://www.lazyvim.org/), with the
  Catppuccin (Mocha) colorscheme and the Go, Python, DAP (debugging), and test LazyVim extras
  enabled.

- **[`ghostty/`](ghostty/config.ghostty)** — Config for the [Ghostty](https://ghostty.org/)
  terminal emulator: Catppuccin Mocha theme and vim-like keybindings for split navigation, split
  resizing, and tab switching.

- **[`hypr/`](hypr/README.md)** — [Hyprland](https://hyprland.org/) config (Lua-based), plus
  hypridle, hyprlock (Catppuccin Mocha), and hyprpaper. See its README for dependencies and setup.

- **[`git/`](git/.gitconfig)** — Git config using [delta](https://github.com/dandavison/delta) as
  the diff/pager, with side-by-side view, line numbers, and navigation.

## Usage

These files are meant to be symlinked into place (e.g. `~/.zshrc`, `~/.config/nvim`,
`~/.config/ghostty/config`, `~/.config/hypr/`, `~/.gitconfig`) rather than copied.
