require("symbols-outline").setup({
  width = 20,
})

vim.keymap.set('n', '<leader>t', ':SymbolsOutline<CR>', { silent = true })
