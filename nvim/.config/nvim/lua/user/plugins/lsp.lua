local P = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
}

P.config = function()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  local on_attach = function(client,bufnr)
    local mapping = vim.keymap.set
    local function opts(desc) return {noremap = true, silent = true, buffer = bufnr, desc = desc} end
    mapping("n","gg",vim.lsp.buf.hover,opts("testin"))
    mapping("n","gD",vim.lsp.buf.declaration,opts("testing"))
    mapping("n","gd",vim.lsp.buf.definition,opts("testing"))
    mapping("n","gr",vim.lsp.buf.references,opts("testing"))
    mapping("n","gi",vim.lsp.buf.implementation,opts("testing"))
    mapping("n","gl",vim.diagnostic.open_float,opts("testign"))
  end
  
  require("mason").setup({})
  mason_lspconfig.setup({
    ensure_installed = {
      --"bashls","clangd","cssls","gopls","html","jsonls","jdtls","tsserver",
      "lua_ls",--"pyright","sqlls","taplo","yamlls"
    },
    automatic_installation = true
  })

  mason_lspconfig.setup_handlers({
    function(server_name) lspconfig[server_name].setup({on_attach=on_attach}) end,
  })
end

return P
