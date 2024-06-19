return {
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
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.loaders.from_vscode.lazy_load()

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
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, 
          { 'i', 's' }
        ),
        ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
      }),
      completion = {
        completeopt = "menu,menuone,noinsert"
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "emoji"}
        }),
      })
  end,
}
