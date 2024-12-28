local M = {}

M.on_attach = function(client, bufnr)
  if client.name == "ruff" then
    client.server_capabilities.hoverProvider = false
  end

  -- Local Keybindings
  local map = vim.keymap.set
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Buffer
  map("n", "<M-.>", vim.lsp.buf.definition, bufopts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "<leader>gR", vim.lsp.buf.references, bufopts)
  map("n", "<leader>gr", vim.lsp.buf.rename, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true, timeout_ms = 3000 })
  end, bufopts)

  -- Diagnostic
  map("n", "<leader>dr", vim.diagnostic.reset, bufopts)
  map("n", "<leader>de", vim.diagnostic.enable, bufopts)
  map("n", "<leader>dd", vim.diagnostic.disable, bufopts)
  map("n", "<leader>dp", vim.diagnostic.goto_prev, bufopts)
  map("n", "<leader>dn", vim.diagnostic.goto_next, bufopts)
  map("n", "<leader>df", vim.diagnostic.open_float, bufopts)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

vim.diagnostic.config({
  float = { border = "single" },
  severity_sort = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
})

return M
