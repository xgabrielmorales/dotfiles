return {
  "navarasu/onedark.nvim",
  dependencies = {},
  lazy = false,
  priority = 1000,
  opts = {
    style = "dark",
    term_colors = true,
    transparent = true,
    code_style = {
      strings = "none",
      comments = "italic",
      keywords = "none",
      functions = "none",
      variables = "none",
    },
    highlights = {
      NormalFloat = { bg = "NONE" },
      FloatBorder = { bg = "NONE", fg = "#ABB2BF" },
      ColorColumn = { bg = "NONE" },
    },
  },
  config = function(_, opts)
    local onedark = require("onedark")
    onedark.setup(opts)
    onedark.load()
  end,
}
