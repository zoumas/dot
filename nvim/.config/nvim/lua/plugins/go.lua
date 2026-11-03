-- Config names golangci-lint looks for in a project.
local golangci_configs = { ".golangci.yml", ".golangci.yaml", ".golangci.toml", ".golangci.json" }

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
  {
    -- Report structs whose field order wastes memory to padding. See the
    -- golangci package for the configs.
    --
    -- The default `golangcilint` linter uses the project's config, or
    -- ~/.golangci.yml when the project has none; the latter already enables
    -- fieldalignment. A project with its own config may not, so in such a
    -- project a second linter runs only fieldalignment from a separate config.
    -- gopls also has a fieldalignment analyzer, but it cannot drop the
    -- pointer-ordering reports, so it stays off.
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local config = vim.fn.expand("~/.config/golangci-lint/fieldalignment.yml")
      local linter = vim.deepcopy(require("lint.linters.golangcilint"))
      -- args[1] is "run"; the config flag goes after the subcommand.
      table.insert(linter.args, 2, "--config=" .. config)
      linter.condition = function(ctx)
        -- Stop below $HOME, so ~/.golangci.yml does not count as a project config.
        return vim.fs.find(golangci_configs, {
          path = ctx.dirname,
          upward = true,
          stop = vim.uv.os_homedir(),
        })[1] ~= nil
      end

      opts.linters = opts.linters or {}
      opts.linters.fieldalignment = linter
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.go = vim.list_extend(opts.linters_by_ft.go or {}, { "fieldalignment" })
    end,
  },
}
