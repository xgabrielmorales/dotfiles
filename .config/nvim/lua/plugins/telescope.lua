return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
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
          width = 0.7,
          height = 0.8,
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git", "--no-ignore" },
          previewer = false,
        },
        git_files = {
          previewer = false,
        },
        buffers = {
          sort_mru = true,
          ignore_current_buffer = true,
          previewer = true,
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer },
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>f",  "<CMD>Telescope find_files<CR>" },
    { "<leader>b",  "<CMD>Telescope buffers<CR>" },
    { "<leader>gf", "<CMD>Telescope git_files<CR>" },
  },
}
