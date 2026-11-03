# golangci

golangci-lint configuration that reports structs whose field order wastes
memory to padding (the `fieldalignment` analyzer in `govet`).

## Contents

- `.golangci.yml`: the personal default. golangci-lint's standard linters,
  plus `fieldalignment`. golangci-lint finds it by walking up from the
  project directory, so it applies to any project under `$HOME` that has no
  `.golangci.yml` of its own. A project config replaces it entirely; the two
  are never merged.
- `.config/golangci-lint/fieldalignment.yml`: only the `fieldalignment` check.
  The `nvim` package runs it as a second linter in projects that have their
  own config, so the editor reports padded structs there without changing
  the project's committed config. CI and teammates do not see these reports.

Both configs report wasted size only. `fieldalignment` also reports pointer
ordering ("leading bytes of pointer data"), which affects how much of a value
the garbage collector scans; an exclusion rule drops those messages.

The most compact order is not always the fastest. Two fields that different
goroutines update can end up on one cache line ("false sharing"). Keep such
fields apart on purpose and ignore the report for that struct.

## Dependencies

golangci-lint v2.15.0 or newer (the Mason copy, or `~/.local/bin`).
