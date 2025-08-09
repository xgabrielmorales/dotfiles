return {
  "nvim-lualine/lualine.nvim",
  dependencies = {},
  opts = {
    options = {
      icons_enabled = false,
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree", "Outline" },
      ignore_focus = { "NvimTree", "Outline" },
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", path = 1 } },
      lualine_c = { "diff", "diagnostics" },
      lualine_x = { "branch", "filesize", "fileformat", "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {},
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}

