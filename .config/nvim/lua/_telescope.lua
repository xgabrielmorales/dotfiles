local actions = require("telescope.actions")

require('telescope').setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    initial_mode = "insert",
    mappings = {
      n = { ["q"] = actions.close },
      i = { ["<esc>"] = actions.close},
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      previewer = false,
    },
    git_files = {
      previewer = false,
    },
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
      },
    },
  },
})

vim.keymap.set('n', '<leader>f', ':Telescope git_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { silent = true })
