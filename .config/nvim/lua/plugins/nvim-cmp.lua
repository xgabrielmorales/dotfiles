return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- LSP (Completion Source)
    "hrsh7th/cmp-nvim-lsp",
    -- Lua Snippets (and completion source)
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- Pictograms for LSP completion items
    "onsails/lspkind.nvim",
  },
  config = function()
    require("config.nvim-cmp")
  end,
}
