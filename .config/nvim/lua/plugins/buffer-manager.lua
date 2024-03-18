return {
  "j-morano/buffer_manager.nvim",
  config = function()
    local bmui = require("buffer_manager.ui")
    local opts = { noremap = true }

    vim.keymap.set("n", "<leader>b", bmui.toggle_quick_menu, opts)
  end
}
