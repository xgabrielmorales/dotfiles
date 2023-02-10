local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 25,
    side = "left",
    adaptive_size = true,
    hide_root_folder = true,

    mappings = {
      custom_only = true,
      list = {
        { key = "q", action = "close" },

        { key = "c", action = "cd" },
        { key = "u", action = "dir_up"},

        { key = "<CR>", action = "edit_no_picker" },
        { key = "<BS>", action = "close_node" },
        { key = "W",    action = "collapse_all" },

        { key = "ss", action = "split" },
        { key = "sv", action = "vsplit" },

        { key = "r", action = "rename" },
        { key = "+", action = "create" },
        { key = "d", action = "remove" },

        { key = "R", action = "refresh" },
        { key = "<C-h>", action = "toggle_dotfiles"},
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = false,
    ignore = true,
  },
})

vim.keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>', { silent = true })
