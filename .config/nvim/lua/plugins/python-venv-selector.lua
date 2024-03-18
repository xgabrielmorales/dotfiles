local function restart_lsp(_, _)
  vim.cmd("LspRestart")
end

return {
  "linux-cultist/venv-selector.nvim",
  ft = { "python" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    name = { ".env", ".venv", "env", "venv" },
    auto_refresh = true,
    changed_venv_hooks = { restart_lsp },
  },
}
