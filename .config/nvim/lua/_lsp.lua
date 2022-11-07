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

--------------------------------
-- Python LSP Config
--------------------------------
-- Pyslp
-- https://github.com/python-lsp/python-lsp-server
require('lspconfig').pylsp.setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        -- Style checking
        pydocstyle = { enabled = false },
        pycodestyle = { enabled = true },
        -- Error checking
        pylint = { enabled = false },
        flake8 = { enabled = false },
        pyflakes = { enabled = true },
        -- Code formatting
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- Complexity checking
        mccabe = { enabled = false },
      }
    }
  }
})
-- Pyright
-- https://github.com/microsoft/pyright
require('lspconfig').pyright.setup{
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          -- Unused
          reportUnusedClass = "information",
          reportUnusedImport = "information",
          reportUnusedFunction = "information",
          reportUnusedVariable = "information",
          -- Optional
          reportOptionalOperand = "none",
          reportOptionalIterable = "none",
          reportOptionalSubscript = "none",
          reportOptionalMemberAccess = "none",
          -- Others
          reportMissingImports = "none",
          reportUnboundVariable = "error",
          reportGeneralTypeIssues = "none",
          reportDuplicateImport = "information",
        }
      }
    }
  }
}
--------------------------------
-- Rust LSP Config
--------------------------------
-- Rust Analyzer
require('lspconfig').rust_analyzer.setup({
  on_attach = on_attach,
})
