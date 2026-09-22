return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- the lang.python extra only formats through the ruff LSP, which
        -- leaves imports unsorted; run organize-imports before formatting
        python = { "ruff_organize_imports", "ruff_format" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      -- basedpyright and ruff are also installed on demand by
      -- mason-lspconfig; listing them makes a fresh machine ready up front.
      -- debugpy provides the debugpy-adapter that nvim-dap-python calls
      ensure_installed = { "basedpyright", "ruff", "debugpy" },
    },
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        -- pin pytest instead of letting the adapter guess from the project;
        -- the interpreter is picked up from the project's .venv (uv)
        ["neotest-python"] = { runner = "pytest" },
      },
    },
  },
}
