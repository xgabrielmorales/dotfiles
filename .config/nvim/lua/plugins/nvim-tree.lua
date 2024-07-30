return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = require("config.nvim-tree"),
  keys = {
    { "<C-f>", "<CMD>NvimTreeToggle<CR>" },
  },
}
