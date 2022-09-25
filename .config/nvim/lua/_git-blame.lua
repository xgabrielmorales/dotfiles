vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "<author>, <date>"
vim.g.gitblame_date_format = '%d %b %Y'

vim.keymap.set('n', '<leader>gbi', ':GitBlameToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>gbo', ':GitBlameOpenCommitURL<CR>', { silent = true })
