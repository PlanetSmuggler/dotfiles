return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					node_decremental = "<leader>sd",
					scope_incremental = "<leader>sc",
				},
			},
			-- TODO text objects
		})

		require("nvim-ts-autotag").setup({
			per_filetype = {
				["html"] = { enable_close = true, enable_rename = true, enable_close_slash = true },
			},
		})
	end,
}
