vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local function opts(desc) return {noremap = true, silent = true, desc=desc} end

keymap({"n","v"},"<Space>","",opts("do nothing"))
keymap("n","<Esc>","<cmd>noh<CR>",opts("clear highlights"))
keymap("t","<Esc><Esc>","<C-\\><C-n>",opts("exit terminal mode"))

keymap("n","<C-h>","<C-w>h",opts("go to left window"))
keymap("n","<C-j>","<C-w>j",opts("go to bottom window"))
keymap("n","<C-k>","<C-w>k",opts("go to top window"))
keymap("n","<C-l>","<C-w>l",opts("go to right window"))

keymap("n","<C-s>","<cmd>w<CR>",opts("save the file"))
keymap("n","<C-q>","<cmd>e!<CR>",opts("undo unsaved edits"))

-- TODO tabs and splits

-- leader
local wk = require("which-key")
local builtin = require("telescope.builtin")

local mappings = {
  q = {"<cmd>confirm q<CR>","Quit"},
  e = {"<cmd>NvimTreeToggle<CR>","Toggle file explorer"},
  b = {
    name = "Buffers",
    b = {builtin.buffers,"List Buffers"},
    n = {"<cmd>bnext<CR>","Next Buffe"},
    p = {"<cmd>bprevious<CR>","Previous Buffer"},
    d = {"<cmd>bd<CR>","Delete Buffer"},
    s = {"<cmd>w<CR>", "Save Buffer"},
    a = {"<cmd>wa<CR>", "Save All Buffer"},
  },
  f = {
    name = "Files",
    f = {builtin.find_files,"find files"},
    g = {builtin.live_grep, "grep search"},
    b = {builtin.current_buffer_fuzzy_find,"search this buffer"},
    h = {builtin.help_tags,"help tags"}
  },
  g = {
    name = "git",
    c = {builtin.git_commits, "show git commits"},
    z = {builtin.git_bcommits, "show git commits with diff"},
    b = {builtin.git_branches, "show all git branches"}
  },
  l = {
    name = "lsp",
    r = {builtin.lsp_references, "lspreferences"},
    i = {builtin.lsp_implementations,"lsp implementations"},
    d = {builtin.lsp_definition,"lsp defintion"},
    t = {builtin.lsp_type_definition,"lsp type definition"}
  }
}
wk.register(mappings,{prefix = "<leader>"})
