return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- installed via `go install golang.org/x/tools/gopls@latest` (GOBIN,
        -- see the zsh package) rather than through Mason, so it's enabled
        -- immediately instead of waiting on Mason's async install
        gopls = { mason = false },
      },
    },
  },
}
