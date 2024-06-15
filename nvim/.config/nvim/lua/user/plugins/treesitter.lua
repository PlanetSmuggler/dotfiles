local P = {
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPost","BufNewFile"},
  build = ":TSUpdate",
  dependencies= {"windwp/nvim-ts-autotag"}
}

P.config = function()
  require("nvim-treesitter.install").prefer_git = true
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {enable = true},
    indent = {enable = true},
  })

  require("nvim-ts-autotag").setup({
    per_filetype = {
      ["html"] = {enable_close = true,enable_rename = true, enable_close_slash = true}
    }
  })
end

return P
