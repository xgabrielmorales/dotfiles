local ok, onedark = pcall(require, "onedark")
if not ok then
  return
end

onedark.setup({
  style = 'dark',
  term_colors = true,
  transparent = true,
  code_style = {
    comments = 'none',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  lualine = {
      transparent = true,
  },
})

onedark.load()
