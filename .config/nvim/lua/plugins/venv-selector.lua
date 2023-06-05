return {
  "linux-cultist/venv-selector.nvim",
  config = true,
  ft = { "python" },
  opts = { name = { ".env", ".venv" } },
  keys = {
    { "<leader>ve", "<CMD>VenvSelect<CR>" },
    { "<leader>vc", "<CMD>:VenvSelectCached<CR>" },
  },
}
