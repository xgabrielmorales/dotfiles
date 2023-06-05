return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local onedark = require("onedark")
    onedark.setup({
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
    })
    onedark.load()
  end,
}
