local P = {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons"
}

P.config = function()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin =1

  require("nvim-tree").setup({})
end

return P
