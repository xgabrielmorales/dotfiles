return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },
  config = function()
    vim.g.fzf_vim = {
      grep_multi_line = 3,
      preview_window = {},
    }
  end,
  keys = {
    { "<leader>f", "<CMD>GFiles<CR>" },
    { "<leader>b", "<CMD>Buffers<CR>" },
    { "<leader>rg", "<CMD>Rg<CR>" },
  },
}
