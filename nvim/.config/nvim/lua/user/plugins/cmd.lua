local P = {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = {"MunifTanjim/nui.nvim"}
}

P.config = function()
  vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
  require("fine-cmdline").setup({
    popup = {
      position = {row = "100%",col="50%"},
      size = {width="50%"}
    },
  })
end

return P
