-- Nvim Config by PlanetSmuggler

-- [[ options ]]
local opt = vim.opt

opt.backup = false
opt.undofile = true
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.completeopt = {"menuone","noinsert"}
opt.mouse = "a"
opt.hlsearch = true
opt.showmode = true
opt.laststatus = 2
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 400
opt.timeoutlen = 300
opt.pumheight = 15
opt.pumblend = 0
opt.cmdheight = 1
opt.conceallevel = 0
opt.signcolumn = "number"
opt.showtabline = 2
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- [[ settings ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.termguicolors = true

-- [[ keymaps ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opt = {noremap = true, silent = true}

-- [[ plugins ]]

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

require("lazy").setup({
    
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd[[colorscheme tokyonight]] end
  },

  -- TODO: file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({
        auto_reload_on_write = true,
        hijack_netrw = true,
        view = {
          width = 30,
        },
        renderer = {
          indent_width = 1
        },


        -- TODO: root_dirs

		
      })
      map("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", opts)
      map("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", opts)
      map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", opts)
      map("n", "<leader>eh", "<cmd>lua require('nvim-tree.api').tree.toggle_help()<CR>")
    end
  },



})
