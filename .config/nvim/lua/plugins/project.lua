return {
  "ahmedkhalf/project.nvim",
  config = function()
    local project_nvim = require("project_nvim")

    project_nvim.setup({
      detection_methods = { "pattern" },
      patterns = { ".git" },
      silent_chdir = false,
    })
  end,
}
