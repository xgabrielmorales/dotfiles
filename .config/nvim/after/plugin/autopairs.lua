local ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

nvim_autopairs.setup()
