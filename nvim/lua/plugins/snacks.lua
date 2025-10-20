-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Explorer pane (the tree)
      explorer = {
        enabled = true,
        hidden = true, -- show dotfiles
        ignored = true, -- show files ignored by .gitignore
      },
      -- Pickers (files/grep/etc.)
      picker = {
        hidden = true, -- show dotfiles in pickers
        ignored = true, -- include .gitignore’d in pickers
      },
    },
  },
}
