return {
  "Wansmer/symbol-usage.nvim",
  event = "LspAttach",
  config = function()
    require("symbol-usage").setup({
      references = { enabled = true, include_declaration = true },
      definition = { enabled = false },
      implementation = { enabled = false },
    })
  end,
}
