local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
  change_detection = {
    enabled = true,
    notify = true
  }
}

local plugins = {
  require("user.plugins.colorscheme"),
  require("user.plugins.nvim-tree"),
  require("user.plugins.lualine"),
  require("user.plugins.tabline"),
  require("user.plugins.cmd"),
--require("user.plugins.breadcrumps"),
  require("user.plugins.autopairs"),
  require("user.plugins.gitsigns"),
  require("user.plugins.treesitter"),
  require("user.plugins.indent"),
  require("user.plugins.completions"),
  require("user.plugins.lsp")
}

require('lazy').setup(plugins,opts)




