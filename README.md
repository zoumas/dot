# Dotfiles

Personal configuration files for my development environment.

## Contents

- **[`zsh/`](zsh/.zshrc)** — Zsh config using [zinit](https://github.com/zdharma-continuum/zinit) as
  plugin manager, with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) as prompt, plus
  syntax highlighting, completions, autosuggestions, and fzf-tab. Integrates
  [fzf](https://github.com/junegunn/fzf) and [zoxide](https://github.com/ajeetdsouza/zoxide).

- **[`nvim/`](nvim/)** — Neovim config based on [LazyVim](https://www.lazyvim.org/), with the
  Catppuccin (Mocha) colorscheme and the Go, Python, DAP (debugging), and test LazyVim extras
  enabled.

- **[`ghostty/`](ghostty/config.ghostty)** — Config for the [Ghostty](https://ghostty.org/)
  terminal emulator: Catppuccin Mocha theme and vim-like keybindings for split navigation, split
  resizing, and tab switching.

## Usage

These files are meant to be symlinked into place (e.g. `~/.zshrc`, `~/.config/nvim`,
`~/.config/ghostty/config`) rather than copied.
