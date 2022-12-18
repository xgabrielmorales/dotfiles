require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "python",
    "vim",
    "lua",
  },
  highlight = {
    enable = true,
  },
  auto_install = false,
  sync_install = false
})
