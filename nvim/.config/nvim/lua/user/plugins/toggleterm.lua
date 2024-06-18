local P ={
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy"

}

P.config = function()
  require("toggleterm").setup({
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    
  })
end

return P
