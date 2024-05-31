return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf", build = ":call fzf#install()" },
  config = function()
    vim.g.fzf_preview_window = {}
    vim.g.fzf_layout = { window = { height = 0.5, width = 0.4, } }
  end,
  keys = {
    { "<leader>f", "<CMD>Files<CR>" },
    { "<leader>b", "<CMD>Buffers<CR>" }
  }
}
