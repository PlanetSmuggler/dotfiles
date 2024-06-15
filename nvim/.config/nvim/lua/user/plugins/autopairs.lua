local P = {
  "windwp/nvim-autopairs",
  event = {"InsertEnter"},
  dependencies = {"hrsh7th/nvim-cmp"},
}

P.config = function()
  require("nvim-autopairs").setup()
end

return P
