local P = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000
}

P.config = function()
  vim.cmd[[colorscheme tokyonight]]
end

return P


