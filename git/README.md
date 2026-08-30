# git

Git configuration.

## Contents

`.gitconfig` sets:

- **Identity** — `user.name`/`user.email`.
- **[delta](https://github.com/dandavison/delta)** as the pager for both
  `git diff`/`git log -p` (`core.pager`) and `git add -p`
  (`interactive.diffFilter`), with side-by-side view, line numbers, and
  hunk navigation (`n`/`N`) enabled.
- `merge.conflictstyle = zdiff3` — conflict markers include the common
  ancestor text alongside both sides, making it clearer what actually
  changed on each branch.
- `diff.colorMoved = default` and `diff.algorithm = histogram` — moved
  lines get their own color instead of showing as plain add/remove, and
  histogram tends to produce cleaner diffs than the default myers
  algorithm.
- `core.editor = nvim` — commit messages open in Neovim.
- `init.defaultBranch = main`.
- `pull.rebase = true` — no merge-bubble commits from `git pull`.
- `push.autoSetupRemote = true` — pushing a new branch auto-sets its
  upstream, no more `--set-upstream` nag.
- `fetch.prune = true` — stale remote-tracking branches are removed
  automatically on fetch.
- `rerere.enabled = true` — remembers how you resolved a conflict before
  and reapplies it automatically if it recurs (common during repeated
  rebases).
- `commit.verbose = true` — the diff being committed is shown inside the
  commit-message editor.

## Dependencies

```sh
sudo pacman -S git git-delta
```

`core.editor = nvim` also depends on the `nvim` package.
