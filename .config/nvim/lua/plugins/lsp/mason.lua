return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("mason").setup({})

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",                          -- https://github.com/bash-lsp/bash-language-server
        "docker_compose_language_service", -- https://github.com/microsoft/compose-language-service
        "dockerls",                        -- https://github.com/rcjsuen/dockerfile-language-server-nodejs
        "eslint",
        "jedi_language_server",            -- https://github.com/pappasam/jedi-language-server
        "jsonls",                          -- https://github.com/hrsh7th/vscode-langservers-extracted
        "lua_ls",                          -- https://github.com/LuaLS/lua-language-server
        "nil_ls",                          -- https://github.com/oxalica/nil
        "ruff",                            -- https://github.com/astral-sh/ruff-lsp
        "rust_analyzer",                   -- https://github.com/rust-lang/rust-analyzer
        "ts_ls",                           -- https://github.com/typescript-language-server/typescript-language-server
      },
    })

    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "prettierd",
        "nixfmt",
      },
    })
  end,
}
