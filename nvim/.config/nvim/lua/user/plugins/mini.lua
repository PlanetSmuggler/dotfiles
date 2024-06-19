return {
	"echasnovski/mini.nvim",
	version = false,
	event = "BufReadPre",
	config = function()
		require("mini.pairs").setup()
		-- TODO explore all the modules in this ecosystem
	end,
}
