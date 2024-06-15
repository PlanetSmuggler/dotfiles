vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local function opts(desc) return {noremap = true, silent = true, desc=desc} end

keymap("n","<Space>","",opts("do nothing"))
keymap("n","<Esc>","<cmd>noh<CR>",opts("clear highlights"))

keymap("n","<C-h>","<C-w>h",opts("go to left window"))
keymap("n","<C-j>","<C-w>j",opts("go to bottom window"))
keymap("n","<C-k>","<C-w>k",opts("go to top window"))
keymap("n","<C-l>","<C-w>l",opts("go to right window"))

keymap("n","<C-s>","<cmd>w<CR>",opts("save the file"))
keymap("n","<C-q>","<cmd>e!<CR>",opts("undo unsaved edits"))

keymap("n","<RightMouse>","<cmd>popup PopUp<CR>",opts("open mouse menu")) 
keymap("t","<Esc><Esc>","<C-\\><C-n>",opts("exit terminal mode"))

-- TODO tabs and splits

