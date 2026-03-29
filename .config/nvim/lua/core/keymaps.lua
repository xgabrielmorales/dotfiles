vim.g.mapleader = ","

local map = vim.keymap.set
local options = { silent = true, noremap = true }

map("n", "Q", "<Nop>", options)
map("n", "q:", "<Nop>", options)
map("n", "q/", "<Nop>", options)
map("n", "<ESC><ESC>", ":nohlsearch<CR>", options)

-- Page down/up and center view
map("n", "<C-d>", "<C-d>zz", options)
map("n", "<C-u>", "<C-u>zz", options)

-- Copy relative or absolute path to clipboard
map("n", "<leader>crp", ":let @+ = expand('%:t')<CR>", options)
map("n", "<leader>cap", ":let @+ = expand('%:p')<CR>", options)
