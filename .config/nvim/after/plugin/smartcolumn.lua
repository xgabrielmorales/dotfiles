local ok, smartcolumn = pcall(require, "smartcolumn")
if not ok then
  return
end

smartcolumn.setup({
  colorcolumn = "80",
  disabled_filetypes = { "help", "text" },
  custom_colorcolumn = { python = { "88" }},
  scope = "file",
})
