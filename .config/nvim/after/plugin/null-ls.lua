local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.ruff,

    null_ls.builtins.diagnostics.ruff.with({
      diagnostic_config = {
        signs = true,
        underline = true,
        virtual_text = false,
        severity_sort = true,
        update_in_insert = false,
      }
    })
  },
})
