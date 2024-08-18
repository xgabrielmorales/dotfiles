return {
  "ahmedkhalf/project.nvim",
  dependencies = {},
  opts = require("config.project"),
  config = function(_, opts)
    require("project_nvim").setup(opts)
  end,
}
