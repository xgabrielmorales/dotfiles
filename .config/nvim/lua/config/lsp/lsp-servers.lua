local lspconfig = require("lspconfig")
local M = require("config.lsp.lsp-config")

local servers = {
  "bashls",        -- https://github.com/bash-lsp/bash-language-server
  "dockerls",      -- https://github.com/rcjsuen/dockerfile-language-server-nodejs
  "ruff_lsp",      -- https://github.com/astral-sh/ruff-lsp
  "rust_analyzer", -- https://github.com/rust-lang/rust-analyzer
  "tsserver",      -- https://github.com/typescript-language-server/typescript-language-server
}

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    on_attach = M.on_attach,
    capabilites = M.capabilities,
  })
end


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
