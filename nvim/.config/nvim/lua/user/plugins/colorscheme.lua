return {
  tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd[[colorscheme tokyonight]] end
  },

  catppuccin = {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd[[colorscheme catppuccin]] end
  },

  oxocarbon = {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd[[colorscheme oxocarbon]] end
  }
}
