require("symbols-outline").setup({
  width = 25,
  show_symbol_details = false,
  autofold_depth = 1,
})

vim.keymap.set('n', '<leader>T', ':SymbolsOutline<CR>', { silent = true })
