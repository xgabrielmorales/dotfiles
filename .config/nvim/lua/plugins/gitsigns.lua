return {
  "lewis6991/gitsigns.nvim",
  dependencies = {},
  lazy = false,
  opts = require("config.gitsigns"),
  keys = {
    { "<leader>gs",  "<CMD>Gitsigns stage_hunk<CR>" },
    { "<leader>gu",  "<CMD>Gitsigns reset_hunk<CR>" },
    { "<leader>gi",  "<CMD>Gitsigns preview_hunk<CR>" },
    { "<leader>gn",  "<CMD>Gitsigns next_hunk<CR>" },
    { "<leader>gp",  "<CMD>Gitsigns prev_hunk<CR>" },
    { "<leader>gbi", "<CMD>Gitsigns toggle_current_line_blame<CR>" },
  },
}
