return {
  "navarasu/onedark.nvim",
  dependencies = {},
  lazy = false,
  priority = 1000,
  opts = require("config.onedark-theme"),
  config = function(_, opts)
    local onedark = require("onedark")
    onedark.setup(opts)
    onedark.load()
  end,
}
