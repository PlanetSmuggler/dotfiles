vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local function opts(desc) return {noremap = true, silent = true, desc=desc} end

keymap({"n","v"},"<Space>","",opts("do nothing"))
keymap("n","<Esc>","<cmd>noh<CR>",opts("clear highlights"))
keymap("t","<Esc><Esc>","<C-\\><C-n>",opts("exit terminal mode"))

keymap({"n","v"},"<leader>qq","<cmd>q!<CR>",opts("close the buffer"))
keymap({"n","v"},"<leader>qw","<cmd>wq<CR>",opts("save and close the buffer"))
keymap({"n","v"},"<leader>qqa","<cmd>qa!<CR>",opts("close nvim"))
keymap({"n","v"},"<leader>qwa","<cmd>qwa<CR>",opts("save and close nvim"))

keymap("n","<C-h>","<C-w>h",opts("go to left window"))
keymap("n","<C-j>","<C-w>j",opts("go to bottom window"))
keymap("n","<C-k>","<C-w>k",opts("go to top window"))
keymap("n","<C-l>","<C-w>l",opts("go to right window"))

keymap("n","<C-s>","<cmd>w<CR>",opts("save the file"))
keymap("n","<C-q>","<cmd>e!<CR>",opts("undo unsaved edits"))



-- TODO tabs and splits

-- Telescope
local builtin = require("telescope.builtin")

keymap("n","<leader>ff",builtin.find_files,opts("find files"))
keymap("n","<leader>fs",builtin.live_grep,opts("search files"))
keymap("n","<leader>fb",builtin.buffers,opts("show all opened buffers"))
keymap("n","<leader>ft",builtin.tags,opts("show all tags"))
keymap("n","<leader>fgc",builtin.git_commits,opts("show git commits"))
keymap("n","<leader>fgb",builtin.git_branches,opts("show all branches"))

-- TODO nvim-tree
-- Misc
keymap("n","<leader>l","<cmd>:Lazy<CR>",opts("Open Lazy"))
