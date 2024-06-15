local P = {
  "nvim-lualine/lualine.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"}
}

P.config = function()
  require("lualine").setup({})
end

return P
