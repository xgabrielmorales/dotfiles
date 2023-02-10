local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return
end


gitsigns.setup({
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '+',
      numhl='GitSignsAddNr',
      linehl='GitSignsAddLn'
    },
    change = {
      hl = 'GitSignsChange',
      text = '~',
      numhl='GitSignsChangeNr',
      linehl='GitSignsChangeLn'
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '-',
      numhl='GitSignsDeleteNr',
      linehl='GitSignsDeleteLn'
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '*',
      numhl='GitSignsChangeNr',
      linehl='GitSignsChangeLn'
    },
  },
  attach_to_untracked = false,
  current_line_blame_formatter = ' <author>, <author_time:%Y-%m-%d>: <abbrev_sha>',
  current_line_blame_opts = {
    virt_text = true,
    delay = 250,
  },
})

vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', { silent = true })
vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>', { silent = true })
vim.keymap.set('n', '<leader>gi', ':Gitsigns preview_hunk<CR>', { silent = true })
vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>', { silent = true })
vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', { silent = true })
vim.keymap.set('n', '<leader>gbi', ':Gitsigns toggle_current_line_blame<CR>', { silent = true })
