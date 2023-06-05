local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- Python
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
      },
    }),
  },
})
