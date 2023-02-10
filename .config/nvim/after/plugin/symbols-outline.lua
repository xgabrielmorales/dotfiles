local ok, symbols_outline = pcall(require, "symbols-outline")
if not ok then
  return
end

symbols_outline.setup({
  width = 25,
  show_symbol_details = false,
  autofold_depth = 1,
})

vim.keymap.set('n', '<leader>T', ':SymbolsOutline<CR>', { silent = true })
