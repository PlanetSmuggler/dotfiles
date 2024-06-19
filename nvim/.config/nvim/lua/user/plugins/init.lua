return {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},
	{
		"nacro90/numb.nvim",
		config = true,
		event = "BufReadPre",
		-- peak any line using :{number}
	},
	{
		"nvimdev/indentmini.nvim",
		config = function()
			require("indentmini").setup({})
		end,
		event = "BufReadPre",
		-- TODO change this
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		-- TODO customize this
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-treee/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"LunarVim/breadcrumbs.nvim",
		dependencies = "SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				},
			})

			require("breadcrumbs").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = "rcarriga/nvim-notify",
		config = function()
			require("noice").setup({})
		end,
	},
	require("user.plugins.mini"),
	require("user.plugins.telescope"),
	require("user.plugins.treesitter"),
	require("user.plugins.colorscheme")["tokyonight"],
	require("user.plugins.nvim-tree"),
	require("user.plugins.completions"),
	require("user.plugins.lsp"),
	require("user.plugins.which"),
	require("user.plugins.formatting"),
}
