return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("xgm.lsp")
  end,
}
