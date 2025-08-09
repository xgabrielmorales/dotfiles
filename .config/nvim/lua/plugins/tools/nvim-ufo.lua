return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  -- lazy = true,
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
  config = function(_, opts)
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    require("ufo").setup(opts)
  end,
}
