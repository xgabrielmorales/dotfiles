return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      changedelete = { text = "*" },
    },
    signs_staged_enable = false,
    attach_to_untracked = false,
    current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d>: <abbrev_sha>",
    current_line_blame_opts = { virt_text = true, delay = 250 },
  },
  keys = {
    { "<leader>gs",  "<CMD>Gitsigns stage_hunk<CR>" },
    { "<leader>gu",  "<CMD>Gitsigns reset_hunk<CR>" },
    { "<leader>gi",  "<CMD>Gitsigns preview_hunk<CR>" },
    { "<leader>gn",  "<CMD>Gitsigns next_hunk<CR>" },
    { "<leader>gp",  "<CMD>Gitsigns prev_hunk<CR>" },
    { "<leader>gbi", "<CMD>Gitsigns toggle_current_line_blame<CR>" },
  },
}
