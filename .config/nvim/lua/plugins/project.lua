return {
  "ahmedkhalf/project.nvim",
  config = function()
    local project_nvim = require("project_nvim")

    project_nvim.setup({
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "pyproject.toml" },
      silent_chdir = true,
    })
  end,
}
