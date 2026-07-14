# Zsh

Personal Zsh configuration: [zinit](https://github.com/zdharma-continuum/zinit) as plugin
manager, [Powerlevel10k](https://github.com/romkatv/powerlevel10k) as prompt, and a handful of CLI
tool integrations for fuzzy search, navigation, and file/diff viewing.

## Contents

- **Prompt** — Powerlevel10k, loaded via zinit with instant prompt enabled for fast startup.
  Customize with `p10k configure` or by editing `~/.p10k.zsh`.
- **Plugins** (via zinit) — `zsh-syntax-highlighting`, `zsh-completions`,
  `zsh-autosuggestions`, and `fzf-tab` (replaces the default completion menu with an fzf-driven
  one).
- **Keybindings** — emacs mode (`bindkey -e`), with `^p`/`^n` bound to history search
  backward/forward.
- **History** — 5000 entries, shared across sessions, deduplicated (`hist_ignore_dups`,
  `hist_save_no_dups`, etc.), stored in `~/.zsh_history`.
- **Completion styling** — case-insensitive matching, `LS_COLORS`-aware listing, and `fzf-tab`
  previews: `eza` for directory completion (`cd`, `zoxide`), `bat` for file completion
  (`nvim`/`vim`/`cat`/`bat`).
- **Aliases** — `ls`/`ll`/`la`/`lt` mapped to `eza` (with git status and directory grouping),
  `cat` mapped to `bat`.
- **Shell integrations** — `fzf` keybindings/completion, `zoxide` (aliased to `cd`), and `gh`
  shell completion.
- **fzf + fd** — `fd` backs fzf's file (`FZF_DEFAULT_COMMAND`/ctrl-t) and directory (alt-c)
  search, with `bat`/`eza` previews respectively.
- **`MANPAGER`** — man pages rendered through `bat` for syntax highlighting and paging.

## Dependencies

- [zinit](https://github.com/zdharma-continuum/zinit) — plugin manager; auto-installed on first
  run if missing
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) — smarter `cd`
- [fd](https://github.com/sharkdp/fd) — fast file/directory search, used as fzf's backing search
  command
- [eza](https://github.com/eza-community/eza) — modern `ls` replacement
- [bat](https://github.com/sharkdp/bat) — `cat` replacement with syntax highlighting, also used
  as the man pager
- [gh](https://cli.github.com/) — GitHub CLI, for shell completion

## Setup

1. Install the dependencies above (all available in Arch's official repos).
2. Symlink the config into place:

   ```sh
   ln -s "$(pwd)/.zshrc" ~/.zshrc
   ```

3. Start a new shell. Zinit and its plugins install automatically on first run.
