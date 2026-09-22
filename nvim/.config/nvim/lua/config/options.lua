-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- basedpyright over pyright: stricter checks plus Pylance-level features
-- (inlay hints, semantic tokens); read by the lang.python extra
vim.g.lazyvim_python_lsp = "basedpyright"
