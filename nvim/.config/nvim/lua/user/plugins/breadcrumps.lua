local P = {
  "LunarVim/breadcrumbs.nvim",
  dependencies = {"SmiteshP/nvim-navic"}
}

P.config = function()
  require("breadcrumbs").setup()
end

return P
