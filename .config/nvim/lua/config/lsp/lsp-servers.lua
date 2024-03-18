local lspconfig = require("lspconfig")
local M = require("config.lsp.lsp-config")

--------------------------------
-- Python LSP Config
--------------------------------
-- Jedi Language Server
-- https://github.com/pappasam/jedi-language-server
lspconfig.jedi_language_server.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  init_options = {
    diagnostics = {
      enable = false,
    },
  },
})

-- Ruff Language Server
-- https://github.com/astral-sh/ruff-lsp
lspconfig.ruff_lsp.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

--------------------------------
-- Rust LSP Config
--------------------------------
-- Rust Analyzer
-- https://github.com/rust-lang/rust-analyzer
lspconfig.rust_analyzer.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

--------------------------------
-- Lua LSP Config
--------------------------------
--  Lua Language Server
-- https://github.com/LuaLS/lua-language-server
lspconfig.lua_ls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim", "require" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
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
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

--------------------------------
-- Javascript LSP Config
--------------------------------
-- Typescript Language Server
-- https://github.com/typescript-language-server/typescript-language-server
lspconfig.tsserver.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

--------------------------------
-- Docker LSP Config
--------------------------------
-- Dockerfile Language Server
-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
lspconfig.dockerls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})
