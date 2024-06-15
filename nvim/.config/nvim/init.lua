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
 
  -- colorshceme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd[[colorscheme tokyonight-night]] end
  },

  -- TODO: cutomize this status bar 
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("lualine").setup({})
    end
  },

  -- tabline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("bufferline").setup({})
    end
  },

  -- explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({})
    end
  },


  -- auto pairs
 {
  "windwp/nvim-autopairs",
  event = {"InsertEnter"},
  dependencies = {"hrsh7th/nvim-cmp"},
  config = function()
    require("nvim-autopairs").setup({})
  end
 },

 -- LSP
 
 {
   "willamboman/mason.nvim",
   config = function() require("mason").setup({})end
 },

 {
   "williamboman/mason-lspconfig.nvim",
   config = function()
     require("mason-lspconfig").setup({
       ensure_installed = {
         "bashls",
         "clangd",
         "cssls",
         "gopls",
         "html",
         "jsonls",
         "jdtls",
         "tsserver",
         "lua_ls",
         "pyright",
         "sqlls",
         "taplo",
         "yamlls",
       },
       automatic_installation = true
     })
   end
 },

 {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      local on_attach = function(client,bufnr)
        local mapping = vim.keymap.set
        local options = {noremap = true,silent = true, buffer = bufnr}

        mapping("n","K",vim.lsp.buf.hover,options)
      end

      mason_lspconfig.setup_handlers({
        function(server_name) lspconfig[server_name].setup({on_attach=on_attach}) end,
      })
    end
 },

 -- completions -- TODO pendina
  {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect"
        },
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body)end
        },
        mapping = cmp.mapping.preset.insert({
           ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      })

    end

  }

})
  
