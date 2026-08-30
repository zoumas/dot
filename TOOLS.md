# Tools

A reference list of the CLI tools this setup relies on — what each one is
for and what it replaces, if anything. Config for most of these lives in
the `zsh` package; a few are standalone (installed, not wired into any
dotfile).

## Shell & navigation

| Tool | Replaces | What it does |
| --- | --- | --- |
| [zsh](https://www.zsh.org/) | bash | The shell itself (`zsh` package) |
| [zinit](https://github.com/zdharma-continuum/zinit) | — | zsh plugin manager |
| [powerlevel10k](https://github.com/romkatv/powerlevel10k) | — | zsh prompt |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` | Frecency-based directory jumping |
| [atuin](https://github.com/atuin-sh/atuin) | shell history | SQLite-backed history with context (cwd, exit code, duration) and fuzzy search |
| [fzf](https://github.com/junegunn/fzf) | — | Fuzzy finder; powers `Ctrl+T`/`Alt+C`/`Ctrl+R`-style widgets and completion |

## Files & text

| Tool | Replaces | What it does |
| --- | --- | --- |
| [eza](https://github.com/eza-community/eza) | `ls` | Icons, git status, directory grouping |
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax highlighting, git-diff markers, also used for `MANPAGER` |
| [fd](https://github.com/sharkdp/fd) | `find` | Simpler syntax, respects `.gitignore` by default |
| [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) | `grep` | Faster recursive search, `.gitignore`-aware |
| [sd](https://github.com/chmln/sd) | `sed` | Find/replace without regex-escaping puzzles |
| [dust](https://github.com/bootandy/dust) | `du` | Visual bar-chart disk usage by directory |
| [duf](https://github.com/muesli/duf) | `df` | Color-coded disk/partition overview |

## Docs & data

| Tool | Replaces | What it does |
| --- | --- | --- |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer) (`tldr`) | — | Example-based command help, complements `man` |
| `man-db` + `bat` | plain `man` | Man pages rendered with syntax highlighting (`MANPAGER`) |
| [jq](https://github.com/jqlang/jq) | — | JSON query/processing |
| [yq](https://github.com/mikefarah/yq) | — | Same idea as `jq`, for YAML |

## Git & GitHub

| Tool | Replaces | What it does |
| --- | --- | --- |
| [git-delta](https://github.com/dandavison/delta) | plain diff output | Syntax-highlighted, side-by-side diffs for `git diff`/`log`/`add -p` (`git` package) |
| [gh](https://cli.github.com/) | — | GitHub CLI; shell completions wired into `zsh` |

## System info & monitoring

| Tool | Replaces | What it does |
| --- | --- | --- |
| `htop` | `top` | Interactive process viewer |
| `bashtop` | `top`/`htop` | Fuller resource monitor (CPU/mem/disk/net) |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | `neofetch` (unmaintained) | System info summary |

## Desktop-integration

| Tool | What it does |
| --- | --- |
| [cliphist](https://github.com/sentriz/cliphist) + `wl-clipboard` | Clipboard history, `SUPER+Shift+V` (see `hypr` package) |
| `playerctl` | Media playback control (`SUPER+F7-F9`) |
| `wireplumber` (`wpctl`) | Audio volume/mute control (`SUPER+F1-F3`) |
| [hyprshot](https://github.com/Gustash/hyprshot) | Screenshots (`SUPER+S`/`Shift+S`/`Ctrl+S`) |

Standalone tools (`tealdeer`, `yq`, `dust`, `duf`, `sd`, `bashtop`,
`fastfetch`) aren't referenced by any tracked config — they're just
installed and used directly from the shell.
