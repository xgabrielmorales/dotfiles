local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gn',    vim.lsp.buf.rename)
  vim.keymap.set('n', '<M-.>', vim.lsp.buf.definition)

  vim.keymap.set('n', 'K',     vim.lsp.buf.hover)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)

  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)

  vim.keymap.set('n', '<leader>de', vim.diagnostic.enable)
  vim.keymap.set('n', '<leader>dd', vim.diagnostic.disable)
  vim.keymap.set('n', '<leader>dr', vim.diagnostic.reset)
  vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)

  vim.diagnostic.config({
    signs = true,
    underline = true,
    virtual_text = false,
    severity_sort = false,
    update_in_insert = false,
  })
end

require('lspconfig').pyright.setup{
  on_attach = on_attach,
  single_file_support = true,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = false
      }
    }
  }
}
