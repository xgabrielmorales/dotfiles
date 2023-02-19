local ok, onedark = pcall(require, "onedark")
if not ok then
  return
end

onedark.setup({
  style = 'darker',
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
})

onedark.load()
