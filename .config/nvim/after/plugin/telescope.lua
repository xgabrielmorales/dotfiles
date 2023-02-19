local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end


local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    initial_mode = "insert",
    mappings = {
      n = { ["q"] = actions.close },
      i = { ["<esc>"] = actions.close },
    },
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git", "--no-ignore"},
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
