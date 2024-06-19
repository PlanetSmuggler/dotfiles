return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local on_attach = function(client, bufnr)
			local mapping = vim.keymap.set
			local function opts(desc)
				return { noremap = true, silent = true, buffer = bufnr, desc = desc }
			end
			mapping("n", "K", vim.lsp.buf.hover, opts("testin"))
		end

		require("mason").setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true,
		})
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({ on_attach = on_attach })
			end,
		})
	end,
}
