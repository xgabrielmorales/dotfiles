return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "windwp/nvim-autopairs",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local function border(hl_name)
      return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
      }
    end

    cmp.setup({
      window = {
        completion = {
          border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpPmenu",
          scrollbar = false,
        },
        documentation = {
          border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpDoc",
          scrollbar = false,
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({ { name = "nvim_lsp" } }),
    })
  end,
}
