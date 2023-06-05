local lspconfig = require("lspconfig")
local on_attach = require("xgm.lsp.attach")

--------------------------------
-- Python LSP Config
--------------------------------
-- Jedi Language Server
-- https://github.com/pappasam/jedi-language-server
lspconfig.jedi_language_server.setup({
  on_attach = on_attach,
  init_options = {
    diagnostics = {
      enable = false,
      didOpen = true,
      didChange = false,
      didSave = true,
    },
  },
})

--------------------------------
-- Rust LSP Config
--------------------------------
-- Rust Analyzer
-- https://github.com/rust-lang/rust-analyzer
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})

--------------------------------
-- Lua LSP Config
--------------------------------
--  Lua Language Server
-- https://github.com/LuaLS/lua-language-server
require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim", "require" },
      },
    },
  },
})
