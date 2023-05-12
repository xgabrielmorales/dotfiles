local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end


local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'c', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '<CR>', api.node.open.no_window_picker, opts('Open: No Window Picker'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', 'ss', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'sv', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '+', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', '<C-h>', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))

end

nvim_tree.setup({
  on_attach = on_attach,
  sort_by = "case_sensitive",
  view = {
    width = 25,
    side = "right",
    adaptive_size = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
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
})

vim.keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>', { silent = true })
