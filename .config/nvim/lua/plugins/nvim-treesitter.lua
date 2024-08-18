return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {},
  opts = require("config.nvim-treesitter"),
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
