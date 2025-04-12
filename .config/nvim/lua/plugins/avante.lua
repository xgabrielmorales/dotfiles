return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "claude",
    vendors = {
      {
        claude = {
          api_key_name = "ANTHROPIC_API_KEY",
          endpoint = "https://api.anthropic.com",
          model = "claude-3-7-sonnet-20250219",
          timeout = 30000,
          temperature = 0,
          max_tokens = 4096,
          disable_tools = true,
        },
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
