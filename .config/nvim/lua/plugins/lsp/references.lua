return {
  "romus204/referencer.nvim",
  config = function()
    require("referencer").setup({
      enable = true,
      format = " %d reference(s)",
      lsp_servers = { "zuban" },
      kinds = {
        5, -- Class
        6, -- M̀ethods
        12, -- Functions
      },
    })
  end,
}
