return function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set

  -- Buffer
  map("n", "<M-.>", vim.lsp.buf.definition, bufopts)
  map("n", "<leader>gr", vim.lsp.buf.rename, bufopts)
  map("n", "<leader>gR", vim.lsp.buf.references, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

  -- Diagnostic
  map("n", "<leader>dr", vim.diagnostic.reset, bufopts)
  map("n", "<leader>de", vim.diagnostic.enable, bufopts)
  map("n", "<leader>dd", vim.diagnostic.disable, bufopts)
  map("n", "<leader>dp", vim.diagnostic.goto_prev, bufopts)
  map("n", "<leader>dn", vim.diagnostic.goto_next, bufopts)
  map("n", "<leader>df", vim.diagnostic.open_float, bufopts)

  map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true, timeout_ms = 3000 })
  end, bufopts)

  vim.diagnostic.config({
    signs = true,
    underline = true,
    virtual_text = false,
    severity_sort = false,
    update_in_insert = false,
  })
end
