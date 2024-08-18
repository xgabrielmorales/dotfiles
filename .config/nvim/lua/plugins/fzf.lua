return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },
  config = function()
    vim.g.fzf_preview_window = {}
  end,
  keys = {
    { "<leader>f", "<CMD>Files<CR>" },
    { "<leader>b", "<CMD>Buffers<CR>" },
  },
}
