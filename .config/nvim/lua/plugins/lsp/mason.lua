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
        "bashls",
        "docker_language_server",
        "jedi_language_server",
        "jsonls",
        "lua_ls",
        "nil_ls",
        "ruff",
        "rust_analyzer",
        "ts_ls",
        "yamlls",
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
