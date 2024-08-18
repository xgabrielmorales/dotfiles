return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  -- lazy = true,
  opts = require("config.nvim-ufo"),
  config = function(_, opts)
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    require("ufo").setup(opts)
  end,
}
