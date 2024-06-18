return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {"nvim-telescope/telescope-fzf-native.nvim",build = "make"},
    "nvim-telescope/telescope-media-files.nvim"
  },
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("fzf")
    -- TODO telescope keybindings
  end
}

