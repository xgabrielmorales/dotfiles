local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end


local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', '<M-.>',      vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>gR', vim.lsp.buf.references, bufopts)

  vim.keymap.set('n', 'K',     vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', '<leader>dr', vim.diagnostic.reset, bufopts)
  vim.keymap.set('n', '<leader>de', vim.diagnostic.enable, bufopts)
  vim.keymap.set('n', '<leader>dd', vim.diagnostic.disable, bufopts)
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, bufopts)

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

  vim.keymap.set('n', '<leader>cf', function()
    vim.lsp.buf.format { async = true, timeout_ms = 3000 }
  end, bufopts)

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
local pylsp_settings = ({
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
local pyright_settings = ({
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        diagnosticMode = "openFilesOnly",
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
})
-- Jedi Language Server
-- https://github.com/pappasam/jedi-language-server
lspconfig.jedi_language_server.setup({
  on_attach = on_attach,
  init_options = {
    diagnostics = {
      enable = false,
      didOpen = true,
      didChange = false,
      didSave = true
    },
  },
})

-- Ruff Language Server
-- https://github.com/charliermarsh/ruff-lsp
local ruff_lsp_settings = ({
  on_attach = on_attach,
})
--------------------------------
-- Rust LSP Config
--------------------------------
-- Rust Analyzer
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})
