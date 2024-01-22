local lspconfig = require("lspconfig")
local on_attach = require("xgm.lsp.attach")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--------------------------------
-- Python LSP Config
--------------------------------
-- Jedi Language Server
-- https://github.com/pappasam/jedi-language-server
lspconfig.jedi_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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
  capabilities = capabilities,
})

--------------------------------
-- Lua LSP Config
--------------------------------
--  Lua Language Server
-- https://github.com/LuaLS/lua-language-server
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim", "require" },
      },
    },
  },
})


--------------------------------
-- Bash LSP Config
--------------------------------
--  Lua Language Server
-- https://github.com/bash-lsp/bash-language-server
lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
})
