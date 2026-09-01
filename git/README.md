# git

Git configuration.

## Contents

`.gitconfig` sets:

- **Identity** — `user.name`/`user.email`.
- `url."git@github.com:".insteadOf` — https GitHub clone URLs are rewritten
  to SSH, so `git clone https://github.com/...` uses the SSH key rather than
  asking for credentials.
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

## Machine-local overrides

The last line of `.gitconfig` is:

```gitconfig
[include]
	path = ~/.gitconfig.local
```

That file is **not** tracked here — it holds whatever is specific to one
machine or one employer: work identity, extra `insteadOf` rewrites for hosts
reached through a work SSH key, and so on. Keeping it out of git means the
repo stays portable and no internal hostnames end up in a public history.

Git ignores a missing `[include]` path, so the same tracked config works
unchanged on a machine that has no such file. Because the include is last,
anything it sets overrides the values above it.

## Dependencies

```sh
sudo pacman -S git git-delta
```

`core.editor = nvim` also depends on the `nvim` package.
