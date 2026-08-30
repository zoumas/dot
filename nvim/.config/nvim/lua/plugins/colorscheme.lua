return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_background = "medium"
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox-material" } },
}
