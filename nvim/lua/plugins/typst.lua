return {
  -- Ensure the LSP binary exists
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "tinymist" })
    end,
  },

  -- Wire up the LSP with sane defaults
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          -- tinymist supports formatting & preview controls
          settings = {
            formatterMode = "typstyle", -- or "typstfmt"
            exportPdf = "never", -- "onSave" | "onType" | "never"
            -- outputPath = "$root/target/$dir/$name", -- optional
          },
        },
      },
    },
  },

  -- Typst filetype support (syntax, ft detection)
  { "kaarmu/typst.vim", ft = "typst" },

  -- OPTIONAL: low-latency live preview (separate tinymist process)
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    opts = {}, -- defaults fine; :TypstPreviewStart to use
  },
}
