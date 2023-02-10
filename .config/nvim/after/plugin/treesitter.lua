local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end


treesitter.setup({
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
