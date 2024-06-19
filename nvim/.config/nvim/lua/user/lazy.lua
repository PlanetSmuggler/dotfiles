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

require("lazy").setup(require("user.plugins"), {
	change_detection = { enabled = true, notify = true },
	checker = { enabled = true, notify = false },
	install = { missing = true, colorscheme = { "tokyonight" } },
	-- defaults = {lazy = true, version = nil}
	performance = {
		rtp = {
			disabled_plugins = { "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "zipPlugin" },
		},
	},
})
