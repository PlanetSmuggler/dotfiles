local P = {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim"
  },
  version = "^1.0.0"
}

P.init = function()
  vim.g.barbar_auto_setup = false
end

P.config = function()
  require("barbar").setup({})
end

local N = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {"nvim-tree/nvim-web-devicons"}
}

N.config = function()
  require("bufferline").setup({})
end

return P
