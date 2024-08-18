return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason_opts = require("config.mason")
    local mason_lspconfig_opts = require("config.mason_lspconfig")
    local mason_null_ls_opts = require("config.mason_null_ls")

    require("mason").setup(mason_opts)
    require("mason-lspconfig").setup(mason_lspconfig_opts)
    require("mason-null-ls").setup(mason_null_ls_opts)
  end,
}
