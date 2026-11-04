# claude

Personal Claude Code skills, shared across machines.

## Contents

- `.claude/skills/bootdev/SKILL.md`: reviewer and instructor for boot.dev
  courses and guided projects. Claude reviews, runs and commits; the user
  writes the code.
- `.claude/skills/go-review/SKILL.md`: Go review checklist based on
  go.dev/wiki/CodeReviewComments and go.dev/wiki/TestComments.

Stow folds these into the existing `~/.claude/skills/` directory as one
symlink per skill. Claude Code's own files in `~/.claude` (credentials,
history, sessions, plugin cache, and skills synced from claude.ai under
`skills/synced/`) stay out of this package.

`settings.json` is not included. Its status line points into the plugin cache
by a version hash, which differs on each machine, and Claude Code rewrites the
file when settings change.

## Dependencies

Claude Code. Project-specific instructions live in each project's own
`CLAUDE.md`, not here.
