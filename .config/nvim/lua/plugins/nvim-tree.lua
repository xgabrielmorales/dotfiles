local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local map = vim.keymap.set
  local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

  map("n", "r", api.fs.rename, opts)
  map("n", "+", api.fs.create, opts)
  map("n", "d", api.fs.remove, opts)
  map("n", "q", api.tree.close, opts)
  map("n", "R", api.tree.reload, opts)
  map("n", "W", api.tree.collapse_all, opts)
  map("n", "sv", api.node.open.vertical, opts)
  map("n", "ss", api.node.open.horizontal, opts)
  map("n", "c", api.tree.change_root_to_node, opts)
  map("n", "u", api.tree.change_root_to_parent, opts)
  map("n", "<CR>", api.node.open.no_window_picker, opts)
  map("n", "<BS>", api.node.navigate.parent_close, opts)
  map("n", "<C-h>", api.tree.toggle_hidden_filter, opts)
end

return {
  "kyazdani42/nvim-tree.lua",
  opts = {
    on_attach = on_attach,
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
    view = {
      width = 40,
      side = "right",
      adaptive_size = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    renderer = {
      root_folder_label = false,
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
  },
  keys = {
    { "<C-f>", "<CMD>NvimTreeToggle<CR>" },
  },
}
