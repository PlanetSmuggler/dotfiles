require("user.options")
require("user.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("user.mappings")
		require("user.autocmd")
	end,
})
