---
name: go-review
description: Review Go code against the official go.dev/wiki/CodeReviewComments and go.dev/wiki/TestComments conventions. Use when reviewing Go source or _test.go files, when the user asks for a Go style/idiom review, or after implementing a Go feature in this project.
---

# Go review

Review Go code against the two canonical Go community style documents:

- https://go.dev/wiki/CodeReviewComments
- https://go.dev/wiki/TestComments

## How to run a review

1. Run `gofmt -l .`, `go vet ./...`, and `go test ./...` first. Mechanical problems
   are not review findings — report them as build/format failures and stop.
2. Read the changed files in full. Do not review a diff hunk without its surrounding
   function.
3. Report findings as `file:line` followed by the rule name and the concrete fix.
4. Rank by severity: correctness first, then idiom, then naming and comments.
5. Skip anything `gofmt` already enforces. Never report formatting as a finding.

Cite the rule by its wiki section name (for example "Indent Error Flow") so the
reader can look it up.

## Source checklist (CodeReviewComments)

Correctness and API shape:

- **Handle Errors** — never discard an error with `_`. Check, handle, or return it.
- **Don't Panic** — return errors instead of panicking in normal control flow.
- **In-Band Errors** — return an explicit `error` or `(value, ok)`, not a sentinel
  like `-1` or `""`.
- **Indent Error Flow** — handle the error in the `if` and keep the happy path at
  minimal indentation. No `else` after a returning `if`.
- **Contexts** — `context.Context` is the first parameter, named `ctx`. Never store
  it in a struct.
- **Goroutine Lifetimes** — every goroutine must have an obvious exit condition.
- **Synchronous Functions** — prefer returning a result over accepting a callback or
  writing to a channel.

Types and receivers:

- **Receiver Names** — one or two letters derived from the type. Never `self`, `this`,
  or `me`. Use the same receiver name on every method of a type.
- **Receiver Type** — pointer receiver by default; value receiver for small immutable
  types. Never mix both on one type.
- **Pass Values** — do not take a pointer just to avoid copying a string or small
  struct.
- **Copying** — do not copy a value whose methods take a pointer receiver.
- **Interfaces** — define the interface in the consuming package, not next to the
  implementation; the implementing package returns concrete types. Do not define an
  interface before it is used, and never on the producer side only "for mocking".

Naming and docs:

- **Mixed Caps** — `camelCase` / `MixedCaps`, never underscores.
- **Initialisms** — `URL`, `ID`, `HTTP`, `API` keep consistent case: `userID` not
  `userId`, `ServeHTTP` not `ServeHttp`.
- **Variable Names** — short names for short scopes, longer names for wider ones.
  `i` in a loop, `pokemonName` at package level.
- **Package Names** — lowercase, no underscores, no `util`/`common`/`helpers`.
  The package name is part of every call site: avoid stutter like `pokeapi.PokeAPIClient`.
- **Doc Comments** — every exported name has a comment starting with that name and
  ending in a period.
- **Package Comments** — directly above `package x`, with no blank line between.
- **Error Strings** — lowercase, no trailing punctuation, so they read correctly when
  wrapped: `fmt.Errorf("fetching location: %w", err)`.
- **Declaring Empty Slices** — prefer `var s []string` over `s := []string{}` unless
  an explicitly non-nil empty slice is required (for example when it is marshalled
  to JSON as `[]` rather than `null`).
- **Named Result Parameters** — only when they make the godoc signature clearer.
- **Naked Returns** — only in very short functions.
- **Imports** — standard library group, blank line, then everything else.

## Test checklist (TestComments)

- **Assert Libraries** — no `testify`/`assert`. Use plain `if` plus `t.Errorf`.
  `github.com/google/go-cmp` is not an assert library and is fine.
- **Equality Comparison and Diffs** — use `cmp.Diff` / `cmp.Equal`, not
  `reflect.DeepEqual`, in new code.
- **Print Diffs** — call `cmp.Diff(want, got)` and label the output
  `(-want +got)` so the sign of each line is unambiguous.
- **Got before Want** — in a formatted message, print the actual value before the
  expected one: `t.Errorf("F(%q) = %v, want %v", in, got, want)`.
- **Identify the Function** — name the function under test in the failure message,
  even when the test name already implies it.
- **Identify the Input** — print the input in the failure message. Never rely on a
  table index like "case 3".
- **Choose Human-Readable Subtest Names** — `t.Run` names become URLs and shell
  arguments; keep them short and readable after spaces become underscores.
- **Compare Full Structures** — diff the whole struct or slice in one comparison
  rather than asserting field by field.
- **Compare Stable Results** — assert on semantic content, not on exact formatting
  that a dependency could change.
- **Keep Going** — `t.Error` to report and continue; `t.Fatal` only when continuing
  is impossible, such as failed setup.
- **Mark Test Helpers** — any helper taking `*testing.T` calls `t.Helper()` first.
- **Table-Driven Tests vs Multiple Test Functions** — one table when the cases share
  logic; separate functions when the logic differs.
- **Test Error Semantics** — compare errors with `errors.Is` / `errors.As`, never by
  matching the error string.

## Reporting format

```
repl_test.go:36: Print Diffs — diff has no directional label. A reader cannot tell
  which side is want. Change the format string to "cleanInput(%q) diff (-want +got):\n%s".
```

State the rule, why it matters here, and the exact replacement. No praise, no recap.
