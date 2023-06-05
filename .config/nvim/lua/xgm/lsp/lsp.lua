local lspconfig = require("lspconfig")
local on_attach = require("xgm.lsp.attach")

-- Jedi Language Server
-- https://github.com/pappasam/jedi-language-server
lspconfig.jedi_language_server.setup({
  on_attach = on_attach,
  init_options = {
    diagnostics = {
      enable = false,
      didOpen = true,
      didChange = false,
      didSave = true
    },
  },
})

-- Ruff Language Server
-- https://github.com/charliermarsh/ruff-lsp
local ruff_lsp_settings = ({
  on_attach = on_attach,
})
