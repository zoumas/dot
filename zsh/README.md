# zsh

Shell configuration, modeled on
[zensh](https://github.com/dreamsofautonomy/zensh).

## Contents

`.zshrc` sets up:

- **[Zinit](https://github.com/zdharma-continuum/zinit)** — plugin manager,
  self-installs into `~/.local/share/zinit` on first run.
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** — prompt.
  No `~/.p10k.zsh` is tracked here; run `p10k configure` interactively to
  pick a style, it'll write its own config file which the `.zshrc` sources
  automatically if present.
- Plugins: `zsh-syntax-highlighting`, `zsh-completions`,
  `zsh-autosuggestions`, `fzf-tab`.
- Oh-My-Zsh snippets: `git`, `sudo`, `archlinux`, `aws`,
  `command-not-found`.
- Emacs-style keybindings (`bindkey -e`), plus `Ctrl+P`/`Ctrl+N` for
  prefix history search and `Alt+W` to kill-region.
- History: 100000 entries, deduped, shared across sessions.
- **[Atuin](https://github.com/atuin-sh/atuin)** — replaces plain shell
  history with a local SQLite database (command + cwd + exit code +
  duration). `Ctrl+R` opens its fuzzy-search TUI, Up-arrow searches inline
  scoped to the current directory, `?` on an empty prompt opens its AI
  natural-language search. Local-only — sync across machines isn't set up.
- **[eza](https://github.com/eza-community/eza)** — `ls` replacement
  (icons, git status, directory grouping); also used for `fzf-tab`'s
  directory previews.
- **[bat](https://github.com/sharkdp/bat)** — `cat` replacement with
  syntax highlighting.
- `zoxide`, with `cd` itself replaced by `zoxide init --cmd cd zsh` — `cd`
  is frecency-based, not just literal paths.

Not carried over from zensh: the macOS Homebrew conditional block (dead
code on Linux), and the plain `ls`/`vim`/`c` aliases (removed — superseded
by eza/bat, and `vim`/`c` weren't used).

## Dependencies

```sh
sudo pacman -S zsh git fzf zoxide atuin eza bat ttf-meslo-nerd
```

## Setup

```sh
chsh -s /usr/bin/zsh
```

Then open a new terminal — Zinit bootstraps itself and installs all
plugins/snippets on first launch. Run `p10k configure` afterward to set up
the prompt.
