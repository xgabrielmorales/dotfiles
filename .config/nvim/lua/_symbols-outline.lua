require("symbols-outline").setup({
  width = 20,
})

vim.keymap.set('n', '<leader>T', ':SymbolsOutline<CR>', { silent = true })
