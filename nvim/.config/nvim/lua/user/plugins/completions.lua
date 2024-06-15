local P = {
  "hrsh7th/nvim-cmp",
  event = {"InsertEnter"},
  dependencies = {
    {"hrsh7th/cmp-nvim-lsp",event="InsertEnter"},
    {"hrsh7th/cmp-emoji",event="InsertEnter"},
    {"hrsh7th/cmp-buffer",event="InsertEnter"},
    {"hrsh7th/cmp-path",event="InsertEnter"},
    {"hrsh7th/cmp-cmdline",event="InsertEnter"},
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {{"rafamadriz/friendly-snippets",event="InsertEnter"},}
    },
    {"saadparwaiz1/cmp_luasnip",event="InsertEnter"},
    {"onsails/lspkind.nvim",event="InsertEnter"},
  }
}

P.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  --local lspkind = require("lspkind")
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args) require("luasnip").lsp_expand(args.body) end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({select=true}),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete({}),
      ['<C-e'] = cmp.mapping.close(),
      -- TODO mappings
    }),
    completion = {
      completeopt = "menu,menuone,preview,noselect"
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp"},
      { name = "buffer" },
      { name = "luasnip" },
      { name = "path" },
      { name = "emoji"}
      }),
    })
    end

return P
