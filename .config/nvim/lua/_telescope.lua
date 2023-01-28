local actions = require("telescope.actions")

require('telescope').setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    layout_config = { height = 0.95, width = 0.4 },
    initial_mode = "insert",
    mappings = {
      n = { ["q"] = actions.close },
      i = { ["<esc>"] = actions.close },
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
      previewer = false,
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
      },
    },
  },
})

vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { silent = true })

-- GIT
vim.keymap.set('n', '<leader>gf', ':Telescope git_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>gC', ':Telescope git_commits<CR>', { silent = true })
vim.keymap.set('n', '<leader>gB', ':Telescope git_branches<CR>', { silent = true })
vim.keymap.set('n', '<leader>gS', ':Telescope git_status<CR>', { silent = true })
